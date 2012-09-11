//
//  FakeNofiticationReceiver.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/08.
//
//

#import "FakeNotificationReceiver.h"

@interface FakeNotificationReceiver()
@property (nonatomic, strong) NSMutableArray *receives;
@property (nonatomic, strong) NSMutableDictionary* userInfos;
@end

@implementation FakeNotificationReceiver

+ (id)receiver {
    return [[self alloc] init];
}

- (id)init {
    self = [super init];
    if (self) {
        self.receives = [NSMutableArray array];
        self.userInfos = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addReceiveNotification:(NSString *)name {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(recieveAnyNotification:)
                                                 name:name
                                               object:nil];
}

- (void)recieveAnyNotification:(NSNotification*)notification {
    
    [self.receives addObject:notification.name];
    if(notification.userInfo != nil) {
        [self.userInfos setObject:notification.userInfo forKey:notification.name];
    }
}

- (BOOL)didReceivedNotification:(NSString *)name {
    return [self.receives indexOfObject:name] != NSNotFound ? YES : NO;
}

- (NSDictionary*)userInfoForRecivedNotification:(NSString *)name {
    return (NSDictionary*)[self.userInfos objectForKey:name];
}

@end
