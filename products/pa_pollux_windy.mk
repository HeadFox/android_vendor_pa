# Copyright (C) 2013 ParanoidAndroid Project
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

# Check for target product

ifeq (pa_d802,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_pollux_windy

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit PSD device product
$(call inherit-product, vendor/psd/products/psd_sgp311.mk)

TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 1920

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
 
# Common Sony Resources
$(call inherit-product, device/sony/common/resources.mk)

# Inherit from pollux_windy device
$(call inherit-product, device/sony/pollux_windy/pollux_windy.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := pollux_windy
PRODUCT_NAME := pa_pollux_windy
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia Tablet Z Wi-Fi
PRODUCT_MANUFACTURER := Sony

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d802 BUILD_FINGERPRINT=lge/g2_open_com/g2:4.4.2/KOT49I.D80220a/D80220a.1392133741:user/release-keys PRIVATE_BUILD_DESC="g2_open_com-user 4.4.2 KOT49I.D80220a D80220a.1392133741 release-keys"

endif
