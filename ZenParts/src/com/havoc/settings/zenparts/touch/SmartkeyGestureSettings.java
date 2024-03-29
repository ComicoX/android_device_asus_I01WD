/**
 * Copyright (C) 2016 The CyanogenMod project
 *               2017 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.havoc.settings.zenparts.touch;

import android.app.ActionBar;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.UserHandle;
import android.provider.Settings;
import android.view.MenuItem;

import android.preference.PreferenceActivity;
import androidx.preference.ListPreference;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragment;
import androidx.preference.PreferenceManager;
import androidx.preference.SwitchPreference;

import com.android.internal.custom.hardware.LineageHardwareManager;
import com.android.internal.custom.hardware.TouchscreenGesture;

import com.havoc.settings.zenparts.R;

import java.lang.System;

import com.havoc.settings.zenparts.touch.TouchUtils;

public class SmartkeyGestureSettings extends PreferenceActivity
        implements PreferenceFragment.OnPreferenceStartFragmentCallback {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (savedInstanceState == null) {
            getFragmentManager().beginTransaction()
                    .replace(android.R.id.content, getNewFragment())
                    .commit();
        }
    }

    private PreferenceFragment getNewFragment() {
        return new MainSettingsFragment();
    }

    @Override
    public boolean onPreferenceStartFragment(PreferenceFragment preferenceFragment,
            Preference preference) {
        Fragment instantiate = Fragment.instantiate(this, preference.getFragment(),
            preference.getExtras());
        getFragmentManager().beginTransaction().replace(
                android.R.id.content, instantiate).addToBackStack(preference.getKey()).commit();

        return true;
    }

    public static class MainSettingsFragment extends PreferenceFragment {

        private static final String KEY_TOUCHSCREEN_GESTURE = "touchscreen_gesture";
        private static final String TOUCHSCREEN_GESTURE_TITLE = KEY_TOUCHSCREEN_GESTURE + "_%s_title";
        private static final String KEY_HAPTIC_FEEDBACK = "smartkey_gesture_haptic_feedback";

        private SwitchPreference mHapticFeedback;

        private TouchscreenGesture[] mTouchscreenGestures;
        private ActionBar actionBar;

        @Override
        public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {

            setPreferencesFromResource(R.xml.smartkey_gesture_settings, rootKey);

            actionBar = getActivity().getActionBar();
            assert actionBar != null;
            actionBar.setDisplayHomeAsUpEnabled(true);

            if (isTouchscreenGesturesSupported(getContext())) {
                initSmartkeyGestures();
            }

            mHapticFeedback = (SwitchPreference) findPreference(KEY_HAPTIC_FEEDBACK);
            mHapticFeedback.setOnPreferenceChangeListener(mHapticPrefListener);
        }

        private Preference.OnPreferenceChangeListener mHapticPrefListener =
            new Preference.OnPreferenceChangeListener() {
            @Override
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                final String key = preference.getKey();
                if (KEY_HAPTIC_FEEDBACK.equals(key)) {
                    final boolean value = (Boolean) newValue;
                    TouchUtils.putInt(getContext(), KEY_HAPTIC_FEEDBACK, value ? 1 : 0);
                    return true;
                }
                return false;
            }
        };

        private void initSmartkeyGestures() {
            final LineageHardwareManager manager = LineageHardwareManager.getInstance(getContext());
            mTouchscreenGestures = manager.getTouchscreenGestures();
            final int[] actions = getDefaultGestureActions(getContext(), mTouchscreenGestures);
            for (final TouchscreenGesture gesture : mTouchscreenGestures) {
                if (gesture.id < 1) {
                getPreferenceScreen().addPreference(new SmartkeyGesturePreference(
                        getContext(), gesture, actions[gesture.id]));
                }
            }
        }

        private class SmartkeyGesturePreference extends ListPreference {
            private final Context mContext;
            private final TouchscreenGesture mGesture;

            public SmartkeyGesturePreference(final Context context,
                                                final TouchscreenGesture gesture,
                                                final int defaultAction) {
                super(context);
                mContext = context;
                mGesture = gesture;

                setKey(buildPreferenceKey(gesture));
                setEntries(R.array.smartkey_gesture_action_entries);
                setEntryValues(R.array.smartkey_gesture_action_values);
                setDefaultValue(String.valueOf(defaultAction));
                setIcon(getIconDrawableResourceForAction(defaultAction));

                setSummary("%s");
                setDialogTitle(R.string.smartkey_gesture_action_dialog_title);
                setTitle(TouchUtils.getLocalizedString(
                        context.getResources(), gesture.name, TOUCHSCREEN_GESTURE_TITLE));
            }

            @Override
            public boolean callChangeListener(final Object newValue) {
                final int action = Integer.parseInt(String.valueOf(newValue));
                final LineageHardwareManager manager = LineageHardwareManager.getInstance(mContext);
                if (!manager.setTouchscreenGestureEnabled(mGesture, action > 0)) {
                    return false;
                }
                return super.callChangeListener(newValue);
            }

            @Override
            protected boolean persistString(String value) {
                if (!super.persistString(value)) {
                    return false;
                }
                final int action = Integer.parseInt(String.valueOf(value));
                setIcon(getIconDrawableResourceForAction(action));
                sendUpdateBroadcast(mContext, mTouchscreenGestures);
                return true;
            }

            private int getIconDrawableResourceForAction(final int action) {
                switch (action) {
                    case Constants.ACTION_BACK:
                        return R.drawable.ic_gesture_action_back;
                    case Constants.ACTION_HOME:
                        return R.drawable.ic_gesture_action_home;
                    case Constants.ACTION_RECENTS:
                        return R.drawable.ic_gesture_action_recents;
                    case Constants.ACTION_UP:
                        return R.drawable.ic_gesture_action_up;
                    case Constants.ACTION_DOWN:
                        return R.drawable.ic_gesture_action_down;
                    case Constants.ACTION_LEFT:
                        return R.drawable.ic_gesture_action_left;
                    case Constants.ACTION_RIGHT:
                        return R.drawable.ic_gesture_action_right;
                    case Constants.ACTION_ASSISTANT:
                        return R.drawable.ic_gesture_action_assistant;
                    case Constants.ACTION_WAKE_UP:
                        return R.drawable.ic_gesture_action_wake_up;
                    case Constants.ACTION_SCREENSHOT:
                        return R.drawable.ic_gesture_action_screenshot;
                    case Constants.ACTION_SCREEN_OFF:
                        return R.drawable.ic_gesture_action_screen_off;
                    case Constants.ACTION_CAMERA:
                        return R.drawable.ic_gesture_action_camera;
                    case Constants.ACTION_FLASHLIGHT:
                        return R.drawable.ic_gesture_action_flashlight;
                    case Constants.ACTION_BROWSER:
                        return R.drawable.ic_gesture_action_browser;
                    case Constants.ACTION_DIALER:
                        return R.drawable.ic_gesture_action_dialer;
                    case Constants.ACTION_EMAIL:
                        return R.drawable.ic_gesture_action_email;
                    case Constants.ACTION_MESSAGES:
                        return R.drawable.ic_gesture_action_messages;
                    case Constants.ACTION_PLAY_PAUSE_MUSIC:
                        return R.drawable.ic_gesture_action_play_pause;
                    case Constants.ACTION_PREVIOUS_TRACK:
                        return R.drawable.ic_gesture_action_previous_track;
                    case Constants.ACTION_NEXT_TRACK:
                        return R.drawable.ic_gesture_action_next_track;
                    case Constants.ACTION_VOLUME_DOWN:
                        return R.drawable.ic_gesture_action_volume_down;
                    case Constants.ACTION_VOLUME_UP:
                        return R.drawable.ic_gesture_action_volume_up;
                    case Constants.ACTION_CAMERA_MOTOR:
                        return R.drawable.ic_gesture_action_camera;
                    case Constants.ACTION_FM_RADIO:
                        return R.drawable.ic_gesture_action_fm_radio;
                    default:
                        // No gesture action
                        return R.drawable.ic_gesture_action_none;
                }
            }
        }

        public static void restoreSmartkeyGestureStates(final Context context) {
            if (!isTouchscreenGesturesSupported(context)) {
                return;
            }

            final LineageHardwareManager manager = LineageHardwareManager.getInstance(context);
            final TouchscreenGesture[] gestures = manager.getTouchscreenGestures();
            final int[] actionList = buildActionList(context, gestures);
            for (final TouchscreenGesture gesture : gestures) {
                manager.setTouchscreenGestureEnabled(gesture, actionList[gesture.id] > 0);
            }

            sendUpdateBroadcast(context, gestures);
        }

        private static boolean isTouchscreenGesturesSupported(final Context context) {
            final LineageHardwareManager manager = LineageHardwareManager.getInstance(context);
            return manager.isSupported(LineageHardwareManager.FEATURE_TOUCHSCREEN_GESTURES);
        }

        private static int[] getDefaultGestureActions(final Context context,
                final TouchscreenGesture[] gestures) {
            final int[] defaultActions = context.getResources().getIntArray(
                    R.array.config_defaultTouchscreenGestureActions);
            if (defaultActions.length >= gestures.length) {
                return defaultActions;
            }

            final int[] filledDefaultActions = new int[gestures.length];
            System.arraycopy(defaultActions, 0, filledDefaultActions, 0, defaultActions.length);
            return filledDefaultActions;
        }

        private static int[] buildActionList(final Context context,
                final TouchscreenGesture[] gestures) {
            final int[] result = new int[gestures.length];
            final int[] defaultActions = getDefaultGestureActions(context, gestures);
            final SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
            for (final TouchscreenGesture gesture : gestures) {
                final String key = buildPreferenceKey(gesture);
                final String defaultValue = String.valueOf(defaultActions[gesture.id]);
                result[gesture.id] = Integer.parseInt(prefs.getString(key, defaultValue));
            }
            return result;
        }

        private static String buildPreferenceKey(final TouchscreenGesture gesture) {
            return "touchscreen_gesture_" + gesture.id;
        }

        private static void sendUpdateBroadcast(final Context context,
                final TouchscreenGesture[] gestures) {
            final Intent intent = new Intent(Constants.UPDATE_PREFS_ACTION);
            final int[] keycodes = new int[gestures.length];
            final int[] actions = buildActionList(context, gestures);
            for (final TouchscreenGesture gesture : gestures) {
                keycodes[gesture.id] = gesture.keycode;
            }
            intent.putExtra(Constants.UPDATE_EXTRA_KEYCODE_MAPPING, keycodes);
            intent.putExtra(Constants.UPDATE_EXTRA_ACTION_MAPPING, actions);
            intent.setFlags(Intent.FLAG_RECEIVER_REGISTERED_ONLY);
            context.sendBroadcastAsUser(intent, UserHandle.CURRENT);
        }

        @Override
        public void onSaveInstanceState(Bundle outState) {
            super.onSaveInstanceState(outState);
        }

        @Override
        public void onResume() {
            super.onResume();

            mHapticFeedback.setChecked(
                TouchUtils.getInt(getContext(), KEY_HAPTIC_FEEDBACK, 1) != 0);
        }

        @Override
        public void onDestroy() {
            super.onDestroy();
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
