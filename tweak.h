#import <Foundation/Foundation.h>
#include <RemoteLog.h>

@interface NCNotificationContent : NSObject
- (NSString *)message;
- (NSString *)title;
@end

@interface NCNotificationRequest : NSObject
- (NSString *)sectionIdentifier;
- (NCNotificationContent *)content;
@end


@interface BBSound
@end

@interface BBBulletinRequest
@property (nonatomic,copy) NSString * title; 
@property (nonatomic,copy) NSString * subtitle; 
@property (nonatomic,copy) NSString * message;
@property (nonatomic,copy) NSString * bulletinID; 
@property (nonatomic,copy) NSString * sectionID; 
@property (nonatomic,retain) BBSound * sound; 
@property (assign,nonatomic) BOOL turnsOnDisplay; 
@end

@interface BBBulletin : BBBulletinRequest
@end

@interface BBServer
-(void)publishBulletin:(id)arg1 destinations:(unsigned long long)arg2;
-(void)_clearBulletinIDs:(id)arg1 forSectionID:(id)arg2 shouldSync:(BOOL)arg3;
@end
