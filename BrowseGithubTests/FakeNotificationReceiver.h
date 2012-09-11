//
//  FakeNofiticationReceiver.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/08.
//
//

#import <Foundation/Foundation.h>

@interface FakeNotificationReceiver : NSObject

+ (id)receiver;
- (void)addReceiveNotification:(NSString*)name;
- (BOOL)didReceivedNotification:(NSString*)name;
- (NSDictionary*)userInfoForRecivedNotification:(NSString*)name;
@end
