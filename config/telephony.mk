# Old APNS
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/old-apns-conf.xml:system/etc/old-apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Stk

# Enable tethering
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dun.override=0
