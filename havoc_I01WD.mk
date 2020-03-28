#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/asus/I01WD/device.mk)

# Inherit some common Havoc stuff.
$(call inherit-product, vendor/havoc/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_BRAND := asus
PRODUCT_DEVICE := I01WD
PRODUCT_MANUFACTURER := asus
PRODUCT_MODEL := ASUS_I01WD
PRODUCT_NAME := havoc_I01WD

PRODUCT_GMS_CLIENTID_BASE := android-asus

# Build info
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=ZS630KL \
    PRODUCT_NAME=WW_I01WD

# Official
export export HAVOC_BUILD_TYPE=Official

VENDOR_RELEASE := 10/QP1A.190711.005/17.1810.2002.137-0:user/release-keys
BUILD_FINGERPRINT := asus/WW_I01WD/ASUS_I01WD:$(VENDOR_RELEASE)

PLATFORM_SECURITY_PATCH_OVERRIDE := 2020-02-01
