# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=OPR5.170623.007 BUILD_ID=OPR5.170623.007 BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

ANDROID_NAME := eightzerozero
export ANDROID_NAME

    CUSTOM_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
    BENZO_POSTFIX := -$(shell date -u +%Y%m%d)

ROM_DATE := $(shell date -u +%Y%m%d)-$(shell date -u +%H%M)
ROM_VERSION := $(ROM_DATE)-$(TARGET_DEVICE)
OTA_DATE := $(shell date -u +%Y%m%d)
BENZO_VERSION := $(ROM_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.benzo.version=$(ROM_VERSION) \
  ro.modversion=$(ROM_VERSION)

BENZO_ROM_NAME := Benzo
BENZO_DEVICE_URL := http://files.oceighty.co/benzo

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ota.romname=$(TARGET_DEVICE) \
    ro.ota.version=$(OTA_DATE) \
    ro.ota.device=$(TARGET_DEVICE) \
    ro.ota.manifest=http://oceighty.co/benzorom/ota.xml \
    ro.ota.default_theme=2

# Get kernel GCC version
-include vendor/benzo/config/optimizations/sm.mk

# DragonTC info
DRAGONTC_VERSION := 6.0

DTC_PATH := prebuilts/clang/host/linux-x86/$(DRAGONTC_VERSION)
DTC_VER := $(shell cat $(DTC_PATH)/VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dtc.version=$(DTC_VER)

-include prebuilts/clang/host/linux-x86/$(DRAGONTC_VERSION)/DragonTC.mk