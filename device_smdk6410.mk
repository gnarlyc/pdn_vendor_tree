$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Get a proper init file
PRODUCT_COPY_FILES += \
    device/pandigital/smdk6410/init.smdk6410.rc:root/init.smdk6410.rc

# Place wifi files
PRODUCT_COPY_FILES += \
    device/pandigital/smdk6410/wifi/rt3070sta.ko:system/lib/hw/modules/rt3070sta.ko \
    device/pandigital/smdk6410/wifi/rtnet3070sta.ko:system/lib/hw/modules/rtnet3070sta.ko \
    device/pandigital/smdk6410/wifi/rtutil3070sta.ko:system/lib/hw/modules/rtutil3070sta.ko \
    device/pandigital/smdk6410/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    device/pandigital/smdk6410/wifi/dhcpcd.conf:/system/etc/dhcpcd/dhcpcd.conf

# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

$(call inherit-product-if-exists, vendor/pandigital/smdk6410/smdk6410-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/pandigital/smdk6410/overlay

# Use MDPI artwork
PRODUCT_LOCALES += mdpi

# Keyboards
file := $(TARGET_OUT_KEYLAYOUT)/gpio-keys.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/gpio-keys.kl | $(ACP)
        $(transform-prebuilt-to-target)

# VOLD
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/etc/vold.smdk6410.fstab:system/etc/vold.fstab

# Media Profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/media_profiles.xml:system/etc/media_profiles.xml

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/pandigital/smdk6410/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_smdk6410
PRODUCT_DEVICE := smdk6410
