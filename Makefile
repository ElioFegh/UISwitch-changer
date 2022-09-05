ARCHS= arm64 arm64e
THEOS_DEVICE_IP=localhost

TARGET := iphone:clang:latest:14.5
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = UISwitchchanger

UISwitchchanger_FILES = Tweak.x
UISwitchchanger_CFLAGS = -fobjc-arc
UISwitchchanger_EXTRA_FRAMEWORKS += Alderis


include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += uiswitchchanger
include $(THEOS_MAKE_PATH)/aggregate.mk
