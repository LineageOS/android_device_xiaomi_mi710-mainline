#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

USES_DEVICE_XIAOMI_MI7150_MAINLINE := true

# Inherit from mainline/qcom-common
include device/mainline/qcom-common/BoardConfigMainlineQcomCommon.mk

# A/B
AB_OTA_UPDATER := false

# Boot parameters
BOARD_KERNEL_CMDLINE := \
    $(MAINLINE_COMMON_ANDROIDBOOT_PARAMS) \
    $(MAINLINE_COMMON_KERNEL_PARAMS) \
    $(MAINLINE_QCOM_KERNEL_PARAMS) \
    androidboot.boot_devices=soc@0/1d84000.ufshc \
    androidboot.serialno=meow \
    androidboot.verifiedbootstate=orange \
    console=tty0

BOARD_KERNEL_CMDLINE += \
    androidboot.selinux=permissive \
    audit=0

# Filesystem
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_SOURCE := kernel/xiaomi/mi7150-mainline

TARGET_KERNEL_CONFIG := \
    defconfig \
    sm7150.config

TARGET_KERNEL_CONFIG_EXT := \
    kernel/mainline/configs/fragments/y/arm64/gki_pre.config \
    kernel/mainline/configs/fragments/y/arm64/gki.config \
    kernel/mainline/configs/fragments/y/arm64/gki_post.config \
    kernel/mainline/configs/fragments/y/common.config \
    kernel/mainline/configs/fragments/y/fbcon.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config

# Kernel modules
#BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/configs/modules.load))
#BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/configs/modules.load))
#RECOVERY_KERNEL_MODULES := $(strip $(shell cat $(DEVICE_PATH)/configs/modules.include))

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_USES_METADATA_PARTITION := true
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := mi7150

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Ramdisk
BOARD_RAMDISK_USE_LZ4 := true

# VINTF
DEVICE_MANIFEST_FILE := \
    $(DEVICE_PATH)/vintf/manifest.xml

# Inherit from vendor
-include vendor/xiaomi/mi7150-mainline/BoardConfigVendor.mk
