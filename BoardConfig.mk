DEVICE_PATH := device/samsung/m20lte

# Camera
# libexynoscamera wants the pre-10 ExynosJpegEncoderForCamera(bool) constructor
$(call soong_config_set,libhwjpeg,HWJPEG_ANDROID_VERSION,9)

# The HAL exposes the rear ultra-wide as camera ID 52
$(call soong_config_set,samsungCameraVars,extra_ids,52)

# Kernel
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_CONFIG := m20lte_defconfig
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos.universal7904

# OTA assert
TARGET_OTA_ASSERT_DEVICE := m20lte,m20

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3565158400
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 39845888
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_VENDORIMAGE_PARTITION_SIZE   := 452984832
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/efs:/efs \
    /mnt/vendor/efs:/factory

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.exynos7904

# Sepolicy
BOARD_SEPOLICY_TEE_FLAVOR := mobicore

# SPL
VENDOR_SECURITY_PATCH := 2023-02-01

# Inherit common board flags
include device/samsung/universal7904-common/BoardConfigCommon.mk

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/android.hardware.keymaster@3.0-service.xml
ODM_MANIFEST_FILES += $(DEVICE_PATH)/configs/manifest_no_nfc.xml
