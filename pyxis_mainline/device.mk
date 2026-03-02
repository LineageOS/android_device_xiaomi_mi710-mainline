#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi710-mainline/pyxis_mainline

# Inherit options from mainline/qcom-common
## SoC
TARGET_QCOM_SOC := sdm710
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_AUDIO_HAL := default-aidl
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
$(call inherit-product, device/xiaomi/mi710-mainline/device.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2340

# Firmware
PRODUCT_COPY_FILES += \
    vendor/xiaomi/sdm710-common/proprietary/vendor/firmware/a615_zap.elf:$(TARGET_COPY_OUT_ODM)/firmware/qcom/sdm710/pyxis/a615_zap.mbn

PRODUCT_PACKAGES += \
    all_symlink_firmware_pyxis \
    firmware_pyxis_ipa_fws.mbn

# Init
PRODUCT_PACKAGES += \
    init.pyxis.rc
