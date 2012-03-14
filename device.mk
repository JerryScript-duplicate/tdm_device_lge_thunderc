# XXX
SUB_MODEL := VM670

# XXX: should be full_base_telephony?
$(call inherit-product, build/target/product/full.mk)

$(call inherit-product, build/target/product/languages_small.mk)
$(call inherit-product, vendor/cm/config/common.mk)
$(call inherit-product-if-exists, vendor/lge/thunderc/thunderc-vendor.mk)

PRODUCT_LOCALES := en_US es_ES

PRODUCT_INSTALL_PACKAGE := vendor/google/gapps

DEVICE_PACKAGE_OVERLAYS += device/lge/thunderc/overlay

# XXX: this is non-standard
LOCAL_KERNEL_DIR := device/lge/thunderc/kernels/gingerkernel
LOCAL_KERNEL_MODULES := librasdioif.ko tun.ko wireless.ko
	

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL_DIR)/zImage:kernel

PRODUCT_COPY_FILES += \
    $(foreach f,$(LOCAL_KERNEL_MODULES),$(LOCAL_KERNEL_DIR)/$(f):system/lib/modules/$(f))

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/keylayout/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/keychars/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \

PRODUCT_COPY_FILES += \
    device/lge/thunderc/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/lge/thunderc/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.local.rc:system/etc/init.local.rc \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.thunderc.usb.rc:system/etc/init.thunderc.usb.rc \
    device/lge/thunderc/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/thunderc/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/lge/thunderc/prebuilt/etc/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/lge/thunderc/prebuilt/etc/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \

# Drew's init stuff
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/08dalvik:system/etc/init.d/08dalvik \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/87calibration:system/etc/init.d/87calibration \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/95zipalign:system/etc/init.d/95zipalign \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/96tweak:system/etc/init.d/96tweak \

PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/05mountext:system/etc/init.d/05mountext \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/08dalvik:system/etc/init.d/08dalvik \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.local.rc:system/etc/init.local.rc \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/spn-conf.xml:system/etc/spn-conf.xml \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/profile:system/etc/profile \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \

#WIFI
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/dhcpcd:system/bin/dhcpcd \
    

# BT startup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

 # Board-specific init

# Board-specific init
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/init.thunderc.rc:root/init.thunderc.rc \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/initlogo.rle:root/initlogo.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/ueventd.thunderc.rc:root/ueventd.thunderc.rc \
    

# OFFLINE CHARGING
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/sbin/bootlogo:root/sbin/bootlogo \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/bootimages/opening_01.rle:root/bootimages/opening_01.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/bootimages/opening_02.rle:root/bootimages/opening_02.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/bootimages/opening_03.rle:root/bootimages/opening_03.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/bootimages/opening_04.rle:root/bootimages/opening_04.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/bootimages/opening_05.rle:root/bootimages/opening_05.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/bootimages/opening_06.rle:root/bootimages/opening_06.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/bootimages/opening_07.rle:root/bootimages/opening_07.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/bootimages/opening_08.rle:root/bootimages/opening_08.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/sbin/chargerlogo:root/sbin/chargerlogo \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \

# Backlight
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/tsdown:system/bin/tsdown \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/ami304d:system/bin/ami304d \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/sensors.thunderc.so:system/lib/hw/sensors.thunderc.so \
    

# 2D (using proprietary because of poor perfomance of open source libs)
#PRODUCT_COPY_FILES += \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/gralloc.thunderc.so:system/lib/hw/gralloc.thunderc.so \

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/gralloc.thunderc.so:system/lib/hw/gralloc.thunderc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/hwcomposer.thunderc.so:system/lib/hw/hwcomposer.thunderc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/copybit.thunderc.so:system/lib/hw/copybit.thunderc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmemalloc.so:system/lib/libmemalloc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmemalloc.so:obj/lib/libmemalloc.so

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liboemcamera.so:obj/lib/liboemcamera.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmmjpeg.so:obj/lib/libmmjpeg.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmikecamera.so:obj/lib/libmikecamera.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmikecamera.so:system/lib/libmikecamera.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libcamera_client.so:obj/lib/libcamera_client.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libcamera_client.so:system/lib/libcamera_client.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libcameraservice.so:obj/lib/libcameraservice.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libcameraservice.so:system/lib/libcameraservice.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/camera.thunderc.so:obj/lib/hw/camera.thunderc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/camera.thunderc.so:system/lib/hw/camera.thunderc.so


# Wifi
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/wl:system/bin/wl
    

# SD Card
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/audio.a2dp.default.so:system/lib/hw/audio.a2dp.default.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/audio.primary.thunderc.so:system/lib/hw/audio.primary.thunderc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/audio.primary.default.so:system/lib/hw/audio.primary.default.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/audio_policy.thunderc.so:system/lib/hw/audio_policy.thunderc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/audio.primary.goldfish.so:system/lib/hw/audio.primary.goldfish.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/hw/audio_policy.default.so:system/lib/hw/audio_policy.default.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/bluez-plugin/audio.so:lib/bluez-plugin/audio.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liba2dp.so:obj/lib/liba2dp.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/port-bridge:system/bin/port-bridge \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/qmuxd:system/bin/qmuxd \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/rmt_storage:system/bin/rmt_storage \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/wiperiface:system/bin/wiperiface \

# Unknown (needed or not?)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/cnd:system/bin/cnd

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=160 \
    persist.sys.use_16bpp_alpha

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libidl.so:system/lib/libidl.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liblgeat.so:system/lib/liblgeat.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liblgdrm.so:system/lib/liblgdrm.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libril.so:system/lib/libril.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/rild:system/bin/rild \

# OMX
#PRODUCT_COPY_FILES += \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_nextreaming_divxdec_sharedlibrary.so:system/lib/libomx_nextreaming_divxdec_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_nextreaming_wmadec_sharedlibrary.so:system/lib/libomx_nextreaming_wmadec_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_nextreaming_wmvdec_sharedlibrary.so:system/lib/libomx_nextreaming_wmvdec_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libqcomm_omx.so:system/lib/libqcomm_omx.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libstagefright_omx.so:system/lib/libstagefright_omx.so \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libopencore_common.so:system/lib/libopencore_common.so \

PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxCore.so:system/lib/libOmxCore.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \



# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/firmware/BCM4325D1_004.002.004.0218.0248.hcd:system/etc/firmware/BCM4325D1_004.002.004.0218.0248.hcd
    
# FONTS
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/fonts/Noxchia.ttf:system/fonts/Noxchia.ttf

# IDC file
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/idc/touch_mcs6000.idc:system/usr/idc/touch_mcs6000.idc\
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/packages/app/usbstorage.apk:system/app/usbstorage.apk \



PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=quattrimus
PRODUCT_NAME := full_thunderc
PRODUCT_DEVICE := thunderc
PRODUCT_BRAND := LGE
PRODUCT_MODEL := VM670
PRODUCT_MANUFACTURER := LGE

CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490


PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)
