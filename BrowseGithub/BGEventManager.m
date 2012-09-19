//
//  BGEventManager.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGEventManager.h"
#import "BGReceivedEvents.h"
#import "BGEvent.h"
#import "BGAuthenticationManager.h"

@interface BGEventManager()
@property (nonatomic, strong) NSArray *currentEvents;
@property (nonatomic, strong) BGGithubResource *currentResource;
@end

@implementation BGEventManager

- (void)prepareLoginUserReceivedEvents {
    
    self.currentResource = [BGReceivedEvents receviedEventsWithUser:[[BGAuthenticationManager sharedManager] loginUser]];
}

- (void)reloadCurrentResource:(void (^)(BOOL))callback {
    
    if (!self.currentResource) {
        callback(NO);
        return;
    }
    
    [self.currentResource loadDataWithComplete:^{
        self.currentEvents = ((BGReceivedEvents*)self.currentResource).events;
        callback(YES);
    } failure:^{
        callback(NO);
    }];
}

- (NSInteger)numberOfEvents {
    return [self.currentEvents count];
}

- (id)eventAtIndex:(NSInteger)index {
    return [self.currentEvents objectAtIndex:index];
}
@end
