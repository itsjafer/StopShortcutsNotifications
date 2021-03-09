#include "tweak.h"
#import <Cephei/HBPreferences.h>

static BOOL enabled;
static BOOL filter;

%hook NCNotificationDispatcher

// this is called everytime a notification wants to be posted to the notification center
-(void)postNotificationWithRequest:(NCNotificationRequest*)arg1 {

	// we only care if the tweak is enabled or the app is shortcuts
	if (!enabled || ![[arg1 sectionIdentifier] isEqualToString:@"com.apple.shortcuts"]) {
		%orig;
	}

	// if we have a filter enabled, we need to make sure we check that too
	if (filter && !([[[arg1 content] title] containsString:@"Automation"] 
				 || [[[arg1 content] message] containsString:@"automation"])) {
		%orig;
	}
		
}
%end

%hook BBServer

-(void)publishBulletin:(id)arg1 destinations:(unsigned long long)arg2 {
	BBBulletin *bulletin = ((BBBulletin *)arg1);

	NSString *sectionID = bulletin.sectionID;
	NSString *title = [bulletin.title lowercaseString];
	NSString *message = [bulletin.message lowercaseString];
	// we only care if the tweak is enabled or the app is shortcuts
	if (!enabled || ![sectionID isEqualToString:@"com.apple.shortcuts"]) {
		%orig;
		return;
	}

	// if we have a filter enabled, we need to make sure we check that too
	
	if (filter && !([title containsString:@"Automation"] 
				 || [message containsString:@"automation"])) {
		%orig;
		return;
	}
	// otherwise, we want to silence notifications

	bulletin.sound = nil;
	bulletin.turnsOnDisplay = NO;

	[self _clearBulletinIDs:@[bulletin.bulletinID] forSectionID:bulletin.sectionID shouldSync:YES];

}
%end

%ctor {   
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.itsjafer.stopshortcutsnotifications"];
	[prefs registerBool:&enabled default:YES forKey:@"enabled"];
	[prefs registerBool:&filter default:NO forKey:@"filter"];
    %init;
}
