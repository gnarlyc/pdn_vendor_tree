USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/pandigital/smdk6410/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := smdk6410
TARGET_CPU_ABI := armeabi
TARGET_ARCH_VARIANT := 
TARGET_ARCH_VARIANT_CPU := 
TARGET_ARCH_VARIANT_FPU := 
TARGET_CPU_SMP := false
#TARGET_HAVE_TEGRA_ERRATA_657451 := true

# custom recovery ui
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/pandigital/smdk6410/recovery/recovery_ui.c

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := smdk6410

# Modem
TARGET_NO_RADIOIMAGE := true

# Wifi related defines
#BOARD_WPA_SUPPLICANT_DRIVER := WEXT
#WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := r0
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/rt3070sta.ko"
#WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/lib/hw/wlan/fw_bcm4329.bin nvram_path=/proc/calibration"
#WIFI_DRIVER_MODULE_NAME     := "dhd"

BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_CSR := false

BOARD_KERNEL_CMDLINE := mem=448M@0M nvmem=64M@448M vmalloc=192M video=tegrafb console=ttyS0,115200n8 usbcore.old_scheme_first=1 cpuid=200102 devicetype=1002 btmac=9c5ed6131a00 tegraboot=nand mtdparts=tegra_nand:16384K@12032K(misc),16384K@62208K(recovery),16384K@79104K(boot),204800K@96000K(system),222464K@301312K(cache),4096K@7424K(bootbmp),32768K@28928K(logodata) androidboot.hardware=smdk6410
BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x00000800

BOARD_USES_GENERIC_AUDIO := false

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

TARGET_PREBUILT_KERNEL := device/pandigital/smdk6410/kernel

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
#BOARD_HAS_DATADATA := true
#BOARD_DATADATA_DEVICE := /dev/block/stl10
#BOARD_DATADATA_FILESYSTEM := auto
#BOARD_DATADATA_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
#BOARD_SYSTEM_DEVICE := /dev/block/stl9
#BOARD_SYSTEM_FILESYSTEM := auto
#BOARD_SYSTEM_FILESYSTEM_OPTIONS := llw,check=no
#BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
