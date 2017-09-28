# Benzo Rom 
# 
# See config/optimizations/optimizations.mk to set build optimizations
# See config/common_versions.mk to set build numbers and OTA info

# Inherit build optimizations
include vendor/benzo/config/optimizations/optimizations.mk

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.com.android.dataroaming=false \
    ro.build.selinux=0 \
    persist.debug.wfd.enable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.root_access=3 \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

# Enable ADB authentication
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.secure=0

# Enable MTP by default
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.config=mtp,adb \
    persist.sys.usb.config=mtp,adb

# fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.fingerprint=fpc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/benzo/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions

# Density Backup
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/addon.d/95-backup.sh:system/addon.d/95-backup.sh \
    vendor/benzo/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# init.d support
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/benzo/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/lib64/libjni_keyboarddecoder.so:system/lib64/libjni_keyboarddecoder \
    vendor/benzo/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so \
    vendor/benzo/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so

# Extra packages
PRODUCT_PACKAGES += \
    OmniJaws \
    OmniStyle \
    messaging \
    Terminal

# Busybox & bash
PRODUCT_PACKAGES += \
    Busybox

# TEMP: Permissions
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/permissions/privapp-permissions-google.xml:system/etc/permissions/privapp-permissions-google.xml \
    vendor/benzo/prebuilt/common/etc/permissions/privapp-permissions-platform.xml:system/etc/permissions/privapp-permissions-platform.xml

PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay/common

## Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Inherit common product build prop overrides
-include vendor/benzo/config/common_versions.mk
