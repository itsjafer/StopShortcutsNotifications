include $(THEOS)/makefiles/common.mk
TWEAK_NAME = StopShortcutsNotifications

StopShortcutsNotifications_FILES = tweak.xm
StopShortcutsNotifications_CFLAGS = -fobjc-arc
StopShortcutsNotitications_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += stopshortcutsnotifications
include $(THEOS_MAKE_PATH)/aggregate.mk
