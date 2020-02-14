#include "tweak.h"
#import <Cephei/HBPreferences.h>

static BOOL enabled;

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
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.itsjafer.stopshortcutsnotifications"];
	[prefs registerBool:&enabled default:YES forKey:@"enabled"];
    %init;
}
