include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = stopshortcutsnotifications
DEBUG = 0
stopshortcutsnotifications_FILES = SSNRootListController.m
stopshortcutsnotifications_INSTALL_PATH = /Library/PreferenceBundles
stopshortcutsnotifications_FRAMEWORKS = UIKit
stopshortcutsnotifications_PRIVATE_FRAMEWORKS = Preferences
stopshortcutsnotifications_CFLAGS = -fobjc-arc
stopshortcutsnotifications_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/stopshortcutsnotifications.plist$(ECHO_END)
