#!/usr/bin/env bash
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#


FDEVICE="KJ5"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

# Dirty Fix: Only declare orangefox vars when needed
if [ -f "$(gettop)/bootable/recovery/orangefox.cpp" ]
then
	echo -e "\x1b[96mSetting up OrangeFox build vars...\x1b[m"
	if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
		export OF_MAINTAINER="nino"
		export FOX_VERSION=R11.1_1
		export FOX_BUILD_TYPE="unofficial"
   		export TW_DEFAULT_LANGUAGE="en"
                export FOX_EXTRA_LANGUAGE=0
		export LC_ALL="C"
	 	export OF_FLASHLIGHT_ENABLE=0
		export ALLOW_MISSING_DEPENDENCIES=true
		export OF_USE_GREEN_LED=0
		export OF_HIDE_NOTCH=1
		export OF_USE_MAGISKBOOT=1
		export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
		export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
		export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
		export OF_NO_MIUI_PATCH_WARNING=1
		export FOX_USE_XZ_UTILS=1
		export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	    	export OF_USE_TWRP_SAR_DETECT=1
		export OF_NO_SAMSUNG_SPECIAL=1
		export OF_QUICK_BACKUP_LIST="/boot;/data;"
	    	export FOX_DELETE_AROMAFM=1
                export FOX_EXCLUDE_AROMAFM=1
	    	export FOX_ENABLE_APP_MANAGER=1
		export FOX_EXTREME_SIZE_REDUCTION=1
		export FOX_REMOVE_AAPT=1
                export FOX_EXCLUDE_NANO_EDITOR=1
		export FOX_USE_FSCRYPT_POLICY=2
	    	export FOX_DISABLE_EXTRA_ABOUT_PAGE=1
                export FOX_DELETE_MAGISK_ADDON=1
		export FOX_USE_BUSYBOX_BINARY=0
                export FOX_DELETE_INITD_ADDON=1
	    	export OF_KEEP_DM_VERITY=1
	    	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
	    	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
		export OF_SCREEN_H=2460
		export OF_STATUS_H=100
                export FOX_DONT_KEEP_LOG_HISTORY=1
		export OF_ALLOW_DISABLE_NAVBAR=0 # We don't have physical buttons
		export OF_STATUS_INDENT_LEFT=48
		export OF_STATUS_INDENT_RIGHT=48
		export OF_CLOCK_POS=0
		export OF_SPLASH_MAX_SIZE=100
		export OF_PATCH_AVB20=1
                export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"
		export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
		export FOX_AB_DEVICE=1
		export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
	fi
fi
