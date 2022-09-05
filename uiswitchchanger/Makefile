TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = UISwitchchanger

UISwitchchanger_LIBRARIES = colorpicker
UISwitchchanger_FILES = UISRootListController.m
UISwitchchanger_FRAMEWORKS = UIKit
UISwitchchanger_PRIVATE_FRAMEWORKS = Preferences
UISwitchchanger_EXTRA_FRAMEWORKS += Alderis
UISwitchchanger_INSTALL_PATH = /Library/PreferenceBundles
UISwitchchanger_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
