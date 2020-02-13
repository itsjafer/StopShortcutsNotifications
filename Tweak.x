@interface NCNotificationRequest : NSObject
- (NSString *)sectionIdentifier;
@end

%hook NCNotificationDispatcher

BOOL enabled = NO;

-(void)postNotificationWithRequest:(NCNotificationRequest*)arg1 {

	if ([[arg1 sectionIdentifier] isEqualToString:@"com.apple.shortcuts"]) {
        if (enabled) {
		    return;
        }
	} 
	%orig;
}
%end

BOOL tweakEnabled() {
    NSDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.itsjafer.stopshortcutsnotifications.plist"];
    return settings[@"enabled"] ? [settings[@"enabled"] boolValue] : NO;
}

%ctor {   
    enabled = tweakEnabled();
    NSString *application = [NSBundle mainBundle].bundleIdentifier;
    %init;
}
