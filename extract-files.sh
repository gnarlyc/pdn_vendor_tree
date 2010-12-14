#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

VENDOR=pandigital
DEVICE=smdk6410

rm -r ../../../vendor/$VENDOR/$DEVICE
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary

# Pull needed standard libs
adb pull /system/lib/libdvm.so ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/lib/libminfo.so ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/lib/libgtalk_jni.so ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/lib/libinterstitial.so ../../../vendor/$VENDOR/$DEVICE/proprietary

# Pull HW libs
adb pull /system/lib/hw/copybit.smdk6410.so ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/lib/hw/gralloc.smdk6410.so ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/lib/hw/lights.smdk6410.so ../../../vendor/$VENDOR/$DEVICE/proprietary

# Pull keychar files
adb pull /system/usr/keychars/gpio-keys.kcm.bin ../../../vendor/$VENDOR/$DEVICE/proprietary

# Pull bin files
adb pull /system/bin/dhcpcd.sh ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/filecheck.sh ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/loadWiFi.sh ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/wpa_supplicant.sh ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/iwconfig ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/iwevent ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/iwgetid ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/iwlist ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/iwpriv ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/iwspy ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/checkfile ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/autobl ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/bin/ ../../../vendor/$VENDOR/$DEVICE/proprietary

# Pull wifi files
adb pull /system/etc/wifi/wpa_supplicant.conf ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/etc/Wireless/RT2870STA/RT2870STA.dat ../../../vendor/$VENDOR/$DEVICE/proprietary

# Pull config files
adb pull /system/etc/dhcpcd/dhcpcd.conf ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/etc/asound.conf ../../../vendor/$VENDOR/$DEVICE/proprietary
adb pull /system/etc/vold.conf ../../../vendor/$VENDOR/$DEVICE/proprietary

./setup-makefiles.sh
