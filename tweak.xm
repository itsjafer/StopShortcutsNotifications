#include "tweak.h"

static BOOL enabled = YES;

static BOOL tweakEnabled() {
    NSDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:
        @"/var/mobile/Library/Preferences/com.itsjafer.stopshortcutsnotifications.plist"];

    // we're defaulting to true but this might need to be changed if users
    // find it annoying
    return settings[@"enabled"] ? [settings[@"enabled"] boolValue] : YES; 
}

%hook NCNotificationDispatcher

// this is called everytime a notification wants to be posted to the notification center
-(void)postNotificationWithRequest:(NCNotificationRequest*)arg1 {

    // we make sure that shortcuts does not run the original method
	if ([[arg1 sectionIdentifier] isEqualToString:@"com.apple.shortcuts"]) {
        if (enabled) {
		    return;
        }
	} 

    // for all other apps, run the method as expected
	%orig;
}
%end

%ctor {   
    enabled = tweakEnabled();
    %init;
}
