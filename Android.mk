#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(USES_DEVICE_XIAOMI_MI7150_MAINLINE),true)

ifeq ($(TARGET_DEVICE),davinci_mainline)
$(call add-radio-file,prebuilts/u-boot-sm7150-xiaomi-davinci.img)
endif

endif
