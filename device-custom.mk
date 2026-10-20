#
# Copyright (C) 2021 The LineageOS Project
# Copyright (C) 2022-2024 PixelOS
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/google/redbull/device-custom.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/redfin/overlay-custom

# CHRE
$(call soong_config_set,chre,chre_daemon_dsp_library,//vendor/google/redfin:libadsprpc)

# HBM
PRODUCT_PACKAGES += \
    HbmSVManagerOverlay

# PowerShare
include hardware/google/pixel/powershare/device.mk

# wireless_charger HAL service
include device/google/redfin/wireless_charger/wireless_charger.mk
