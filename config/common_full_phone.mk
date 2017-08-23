# Inherit common stuff
$(call inherit-product, vendor/benzo/config/common.mk)

$(call inherit-product, vendor/benzo/config/telephony.mk)

$(call inherit-product, vendor/addons/config.mk)
