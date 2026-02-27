#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from parent
include device/xiaomi/mi710-mainline/BoardConfig.mk

# Boot parameters
BOARD_KERNEL_CMDLINE += \
    androidboot.hardware=pyxis

# Display
TARGET_SCREEN_DENSITY := 440

# Fastboot
TARGET_BOARD_FASTBOOT_INFO_FILE := $(TARGET_DEVICE_PATH)/misc/fastboot-info.txt

# OTA
TARGET_OTA_ASSERT_DEVICE := pyxis_mainline,pyxis,vela

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 536870912
