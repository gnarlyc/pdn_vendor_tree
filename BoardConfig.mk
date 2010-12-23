# inherit from the proprietary version
-include vendor/pandigital/smdk6410/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := smdk6410
TARGET_CPU_ABI := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_ARCH_VARIANT_CPU := arm1176jzf-s
TARGET_CPU_SMP := false

TARGET_NO_RECOVERY := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true

BOARD_HAS_NO_SELECT_BUTTON := true

USE_CAMERA_STUB := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := ra0
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/rt3070sta.ko"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "ra0"

BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_CSR := false

BOARD_HAVE_CAMERA := false

BOARD_PAGE_SIZE := 0x00000800

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

BOARD_EGL_CFG := device/pandigital/smdk6410/egl.cfg

# fix this up by examining /proc/mtd on a running device
# dev:    size   erasesize  name
# mtd0: 01000000 00020000 "misc"
# mtd1: 01000000 00020000 "recovery"
# mtd2: 01000000 00020000 "boot"
# mtd3: 0c800000 00020000 "system"
# mtd4: 0d940000 00020000 "cache"
# mtd5: 00400000 00020000 "bootbmp"
# mtd6: 02000000 00020000 "logodata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0c800000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

# Setting this to avoid boot locks on the system from using the "misc" partition.
BOARD_HAS_NO_MISC_PARTITION := true


# Below is a sample of how you can tweak the mount points using the board config.
# This is for the Samsung Galaxy S.
# Feel free to tweak or remove this code.
# If you want to add/tweak a mount point, the BOARD_X_FILESYSTEM_OPTIONS are optional.
BOARD_DATA_DEVICE := /dev/block/mmcblk3p2
BOARD_DATA_FILESYSTEM := ext3
BOARD_CACHE_DEVICE := /dev/block/mtdblock4
BOARD_CACHE_FILESYSTEM := yaffs2
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk3p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk2p1
