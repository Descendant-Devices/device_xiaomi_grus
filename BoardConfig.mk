#
# Copyright (C) 2018-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm710-common
-include device/xiaomi/sdm710-common/BoardConfigCommon.mk

BUILD_BROKEN_DUP_RULES := true

DEVICE_PATH := device/xiaomi/grus

# Assert
TARGET_OTA_ASSERT_DEVICE := grus

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
TARGET_KERNEL_CLANG_PATH := $(PWD)/vendor/qcom/sdclang
TARGET_KERNEL_CONFIG := grus_defconfig

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
ODM_MANIFEST_SKUS += grus_global
ODM_MANIFEST_GRUS_GLOBAL_FILES := $(DEVICE_PATH)/manifest-mtdservice.xml

# Fingerprint on display
TARGET_SURFACEFLINGER_FOD_LIB := //device/xiaomi/sdm710-common:libfod_extension.xiaomi_sdm710
TARGET_USES_FOD_ZPOS := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_METADATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Creates metadata partition mount point under root for
# the devices with metadata parition
BOARD_USES_METADATA_PARTITION := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

# Inherit from the proprietary version
-include vendor/xiaomi/grus/BoardConfigVendor.mk
