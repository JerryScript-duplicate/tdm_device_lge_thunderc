#
# This file is the build configuration for a full Android
# build for thunderc hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

PRODUCT_PACKAGES := \
	LiveWallpapersPicker

PRODUCT_PACKAGES += \
	Camera

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/lge/thunderc/device.mk)

# Screen density is actually considered a locale (since it is taken into account
# the the build-time selection of resources). The product definitions including 
# this file must pay attention to the fact that the first entry in the final    
# PRODUCT_LOCALES expansion must not be a density.
PRODUCT_LOCALES += mdpi

# Discard inherited values and use our own instead.
PRODUCT_NAME := cm_thunderc
PRODUCT_DEVICE := thunderc
PRODUCT_BRAND := Android
PRODUCT_MODEL := VM670
PROUDCT_MANUFACTURER := LGE
