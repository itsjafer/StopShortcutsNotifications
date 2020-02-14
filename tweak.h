@interface NCNotificationContent : NSObject
- (NSString *)message;
- (NSString *)title;
@end

@interface NCNotificationRequest : NSObject
- (NSString *)sectionIdentifier;
- (NCNotificationContent *)content;
@end
