#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi710-mainline/pyxis_mainline

# Inherit options from mainline/qcom-common
## SoC
TARGET_QCOM_SOC := sdm710
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
$(call inherit-product, device/xiaomi/mi710-mainline/device.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_PACKAGES += \
    audio.pyxis_mainline.xml

# Boot animation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2340

# Firmware
PRODUCT_PACKAGES += \
    all_symlink_firmware_pyxis

# Init
PRODUCT_PACKAGES += \
    init.pyxis.rc
