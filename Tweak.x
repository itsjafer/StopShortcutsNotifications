@interface NCNotificationRequest : NSObject
- (NSString *)sectionIdentifier;
@end

%hook NCNotificationDispatcher

-(void)postNotificationWithRequest:(NCNotificationRequest*)arg1 {

	if ([[arg1 sectionIdentifier] isEqualToString:@"com.apple.shortcuts"]) {
		return;
	} 
	%orig;
}
%end

%ctor {
    @autoreleasepool {     
        NSString *application = [NSBundle mainBundle].bundleIdentifier;
        if ([application isEqualToString:@"com.apple.springboard"]) {
            %init;
        }
    }
}
