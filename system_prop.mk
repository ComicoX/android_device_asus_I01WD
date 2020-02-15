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

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_steps=7 \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=none \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    audio.offload.video=true \
    audio.deep_buffer.media=true \
    ro.af.client_heap_size_kbyte=7168 \
    tunnel.audio.encode = true \
    audio.offload.buffer.size.kb=32 \
    av.offload.enable=true \
    use.voice.path.for.pcm.voip=true \
    audio.offload.gapless.enabled=true

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.rild.nitz_plmn= \
    persist.rild.nitz_long_ons_0= \
    persist.rild.nitz_long_ons_1= \
    persist.rild.nitz_long_ons_2= \
    persist.rild.nitz_long_ons_3= \
    persist.rild.nitz_short_ons_0= \
    persist.rild.nitz_short_ons_1= \
    persist.rild.nitz_short_ons_2= \
    persist.rild.nitz_short_ons_3= \
    ril.subscription.types=RUIM,RUIM \
    DEVICE_PROVISIONED=1 \
    telephony.lteOnCdmaDevice=1
# Set network mode to (T/L/G/W/1X/EVDO, T/L/G/W/1X/EVDO) for 7+7 mode device on DSDS mode

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=36m \
    dev.pm.dyn_samplingrate=1

# Qcom
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.hw.aac.encoder=true

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1

# System props for the MM modules
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-scan=true \
    media.stagefright.thumbnail.prefer_hw_codecs=true \
    media.settings.xml=/vendor/etc/media_profiles_vendor.xml \
    mmp.enable.3g2=true \
    media.aac_51_output_enabled=true \
    mm.enable.smoothstreaming=true \
    vendor.mm.enable.qcom_parser=47185919 \
    persist.mm.enable.prefetch=true

#Netflix custom property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.netflix.bsp_rev=Q855-16947-1

#
# system props for the data modules
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.use_data_netmgrd=true \
    persist.vendor.data.mode=concurrent

PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

# Simulate sdcard on /data/media
PRODUCT_PROPERTY_OVERRIDES += \
    persist.fuse_sdcard=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.bluetooth.soc=cherokee \
    persist.vendor.btstack.enable.splita2dp=true \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    persist.vendor.btstack.aac_frm_ctl.enabled=true \
    persist.vendor.btstack.enable.twsplus=true \
    persist.bluetooth.avrcpversion=avrcp16 \
    ro.bluetooth.emb_wp_mode=false \
    ro.bluetooth.wipower=false \
    bt.max.hfpclient.connections=1


# RmNet Data
PRODUCT_PROPERTY_OVERRIDES += \
    persist.rmnet.data.enable=true \
    persist.data.wda.enable=true \
    persist.data.df.dl_mode=5 \
    persist.data.df.ul_mode=5 \
    persist.data.df.agg.dl_pkt=10 \
    persist.data.df.agg.dl_size=4096 \
    persist.data.df.mux_count=8 \
    persist.data.df.iwlan_mux=9 \
    persist.data.df.dev_name=rmnet_usb0

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nfc.port=I2C

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    sys.qca1530=detect

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024 \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    debug.sf.enable_hwc_vds=1 \
    config.disable_rtt=true

# Bringup properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.force_sw_gles=1 \
    persist.vendor.radio.atfwd.start=true \
    ro.kernel.qemu.gles=0 \
    qemu.hw.mainkeys=0

# Maintainer
PRODUCT_PROPERTY_OVERRIDES += \
    ro.havoc.maintainer=Comico