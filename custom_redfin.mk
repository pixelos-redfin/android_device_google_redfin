#
# Copyright (C) 2021 The LineageOS Project
# Copyright (C) 2022-2024 PixelOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Drop LineageOS Aperture camera
PRODUCT_NO_CAMERA := true

# Official build & updater configuration
IS_OFFICIAL := true

# Inherit some common PixelOS stuff.
$(call inherit-product, vendor/custom/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/redfin/aosp_redfin.mk)
$(call inherit-product, device/google/redbull/custom_common.mk)

include device/google/redfin/device-custom.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 5
PRODUCT_NAME := custom_redfin
PRODUCT_DEVICE := redfin
PRODUCT_MANUFACTURER := Google

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_GMS_CLIENTID_BASE := android-google
TARGET_DOES_NOT_SUPPORT_GOOGLE_BATTERY := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="redfin-user 14 UP1A.231105.001.B2 11260668 release-keys" \
    BuildFingerprint=google/redfin/redfin:14/UP1A.231105.001.B2/11260668:user/release-keys \
    DeviceProduct=redfin

$(call inherit-product, vendor/google/redfin/redfin-vendor.mk)

PRODUCT_COPY_FILES := $(filter-out \
    vendor/google/redfin/proprietary/vendor/rfs/msm/mpss/readonly/vendor/mbn/mcfg_sw/mbn_sw.dig:% \
    vendor/google/redfin/proprietary/vendor/rfs/msm/mpss/readonly/vendor/mbn/mcfg_sw/mbn_sw.txt:%, \
    $(PRODUCT_COPY_FILES))

# Disable artifact path requirements enforcement
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := false

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += device/google/redfin/redfin/overlay

PRODUCT_SOURCE_ROOT_DIRS += -hardware/google/camera

# Drop AOSP Camera2
PRODUCT_PACKAGES := $(filter-out Camera2, $(PRODUCT_PACKAGES))

