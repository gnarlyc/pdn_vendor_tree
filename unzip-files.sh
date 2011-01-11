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


DEVICE=smdk6410

mkdir -p ../../../vendor/pandigital/$DEVICE/proprietary/ 
unzip -j -o ../../../${DEVICE}_update.zip system/lib/libaudio.so system/lib/hw/copybit.smdk6410.so system/lib/hw/gralloc.smdk6410.so system/lib/hw/lights.smdk6410.so system/usr/keychars/gpio-keys.kcm.bin system/bin/dhcpcd.sh system/bin/filecheck.sh system/bin/loadWiFi.sh system/bin/wpa_supplicant.sh system/bin/iwconfig system/bin/iwevent system/bin/iwgetid system/bin/iwlist system/bin/iwpriv system/bin/iwspy system/bin/checkfile system/bin/autobl system/etc/wifi/wpa_supplicant.conf system/etc/Wireless/RT2870STA/RT2870STA.dat system/etc/dhcpcd/dhcpcd.conf system/etc/asound.conf -d ../../../vendor/pandigital/$DEVICE/proprietary

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/pandigital/$DEVICE/device_$DEVICE-vendor-blobs.mk
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

# This file is generated by device/pandigital/__DEVICE__/extract-files.sh

PRODUCT_COPY_FILES := \\
    vendor/pandigital/__DEVICE__/proprietary/libaudio.so:obj/lib/libaudio.so

PRODUCT_COPY_FILES += \\
    vendor/pandigital/__DEVICE__/proprietary/libaudio.so:system/lib/libaudio.so \\
    vendor/pandigital/__DEVICE__/proprietary/copybit.smdk6410.so:system/lib/hw/copybit.smdk6410.so \\
    vendor/pandigital/__DEVICE__/proprietary/gralloc.smdk6410.so:system/lib/hw/gralloc.smdk6410.so \\
    vendor/pandigital/__DEVICE__/proprietary/lights.smdk6410.so:system/lib/hw/lights.smdk6410.so \\
    vendor/pandigital/__DEVICE__/proprietary/gpio-keys.kcm.bin:system/usr/keychars/gpio-keys.kcm.bin \\
    vendor/pandigital/__DEVICE__/proprietary/dhcpcd.sh:system/bin/dhcpcd.sh \\
    vendor/pandigital/__DEVICE__/proprietary/filecheck.sh:system/bin/filecheck.sh \\
    vendor/pandigital/__DEVICE__/proprietary/loadWiFi.sh:system/bin/loadWiFi.sh \\
    vendor/pandigital/__DEVICE__/proprietary/wpa_supplicant.sh :system/bin/wpa_supplicant.sh \\
    vendor/pandigital/__DEVICE__/proprietary/liwconfig:system/bin/iwconfig \\
    vendor/pandigital/__DEVICE__/proprietary/iwevent:system/bin/iwevent \\
    vendor/pandigital/__DEVICE__/proprietary/iwgetid:system/bin/iwgetid \\
    vendor/pandigital/__DEVICE__/proprietary/iwlist:system/bin/iwlist 
    vendor/pandigital/__DEVICE__/proprietary/iwpriv:system/bin/iwpriv \\
    vendor/pandigital/__DEVICE__/proprietary/iwspy:system/bin/iwspy \\
    vendor/pandigital/__DEVICE__/proprietary/checkfile:system/bin/checkfile \\	
    vendor/pandigital/__DEVICE__/proprietary/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \\
    vendor/pandigital/__DEVICE__/proprietary/RT2870STA.dat:system/etc/Wireless/RT2870STA/RT2870STA.dat \\
    vendor/pandigital/__DEVICE__/proprietary/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \\
    vendor/pandigital/__DEVICE__/proprietary/asound.conf:system/etc/asound.conf
		
EOF	

./setup-makefiles.sh
