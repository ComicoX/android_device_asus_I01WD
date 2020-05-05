#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/asus/I01WD/I01WD-vendor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Properties
-include $(LOCAL_PATH)/system_prop.mk

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:system/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vbmeta

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes_ZS630KL.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/audio_policy_volumes_ZS630KL.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/mixer_paths_tavil.xml

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.msmnile.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# ZenParts
PRODUCT_PACKAGES += \
    ZenParts

# Charger bin
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger/bin/charger:system/bin/charger

# Charger res
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger/res/images/charger/18x32.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/18x32.png \
    $(LOCAL_PATH)/charger/res/images/charger/battery_fail.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/battery_fail.png \
    $(LOCAL_PATH)/charger/res/images/charger/battery_scale.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/battery_scale.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_0_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_0_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_0.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_0.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_0_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_0_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_10_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_10_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_10.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_10.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_10_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_10_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_1_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_1_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_1.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_1.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_1_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_1_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_20_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_20_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_20.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_20.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_20_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_20_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_2_10_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_2_10_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_2_10.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_2_10.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_2_10_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_2_10_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_2_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_2_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_2.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_2.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_2_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_2_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_30_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_30_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_30.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_30.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_30_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_30_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_40_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_40_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_40.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_40.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_40_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_40_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_50_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_50_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_50.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_50.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_50_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_50_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_60_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_60_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_60.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_60.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_60_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_60_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_70_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_70_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_70.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_70.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_70_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_70_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_80_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_80_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_80.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_80.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_80_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_80_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_90_99_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_90_99_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_90_99.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_90_99.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_90_99_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_90_99_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_90_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_90_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_90.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_90.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_90_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_90_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_full_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_full_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_full.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_full.png \
    $(LOCAL_PATH)/charger/res/images/charger/Charging_battery_full_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Charging_battery_full_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_0_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_0_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_0.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_0.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_0_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_0_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_10_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_10_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_10.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_10.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_10_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_10_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_1_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_1_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_1.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_1.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_1_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_1_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_20_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_20_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_20.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_20.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_20_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_20_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_2_10_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_2_10_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_2_10.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_2_10.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_2_10_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_2_10_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_2_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_2_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_2.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_2.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_2_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_2_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_30_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_30_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_30.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_30.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_30_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_30_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_40_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_40_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_40.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_40.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_40_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_40_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_50_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_50_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_50.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_50.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_50_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_50_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_60_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_60_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_60.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_60.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_60_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_60_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_70_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_70_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_70.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_70.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_70_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_70_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_80_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_80_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_80.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_80.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_80_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_80_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_90_99_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_90_99_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_90_99.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_90_99.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_90_99_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_90_99_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_90_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_90_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_90.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_90.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_battery_90_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_battery_90_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_0_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_0_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_0.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_0.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_0_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_0_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_10_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_10_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_10.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_10.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_10_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_10_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_1_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_1_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_1.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_1.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_1_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_1_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_20_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_20_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_20.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_20.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_20_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_20_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_2_10_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_2_10_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_2_10.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_2_10.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_2_10_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_2_10_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_2_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_2_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_2.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_2.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_2_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_2_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_30_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_30_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_30.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_30.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_30_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_30_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_40_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_40_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_40.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_40.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_40_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_40_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_50_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_50_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_50.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_50.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_50_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_50_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_60_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_60_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_60.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_60.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_60_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_60_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_70_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_70_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_70.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_70.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_70_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_70_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_80_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_80_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_80.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_80.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_80_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_80_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_90_99_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_90_99_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_90_99.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_90_99.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_90_99_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_90_99_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_90_CN.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_90_CN.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_90.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_90.png \
    $(LOCAL_PATH)/charger/res/images/charger/Fast-charging_p_battery_90_TW.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/Fast-charging_p_battery_90_TW.png \
    $(LOCAL_PATH)/charger/res/images/charger/OverTempBattery.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/OverTempBattery.png

# Common init scripts
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.recovery.qcom.rc

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan \
    vendor.display.config@1.0

PRODUCT_PACKAGES += \
    vendor.display.config@1.7

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

PRODUCT_BOOT_JARS += \
    WfdCommon

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.asus_msmnile

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/asus/I01WD/prebuilt/system,system)

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# HotwordEnrollement
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/fts_ts.idc:system/usr/idc/fts_ts.idc \
    $(LOCAL_PATH)/keylayout/fts_ts.kl:system/usr/keylayout/fts_ts.kl \
    $(LOCAL_PATH)/keylayout/goodixfp.kl:system/usr/keylayout/goodixfp.kl \
    $(LOCAL_PATH)/keylayout/googlekey_input.kl:system/usr/keylayout/googlekey_input.kl

# Exclude vibrator from InputManager
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:system/etc/media_profiles_vendor.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    SecureElement \
    com.android.nfc_extras

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.asus_msmnile

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Trust HAL
PRODUCT_PACKAGES += \
    lineage.trust@1.0-service

# Update engine
PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

