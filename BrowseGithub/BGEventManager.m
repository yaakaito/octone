//
//  BGEventManager.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGEventManager.h"
#import "BGEvents.h"
#import "BGEvent.h"
#import "BGAuthenticationManager.h"

@interface BGEventManager()
@property (nonatomic, strong) NSMutableArray *events;
@end

@implementation BGEventManager

- (void)setResourcesFromResource:(BGGithubResource *)resource reload:(BOOL)reload {
    
    BGEvents *receivedEvent = (BGEvents*)resource;
    if (reload) {
        self.events = [receivedEvent.events mutableCopy];
    }
    else {
        [self.events addObjectsFromArray:receivedEvent.events];
    }
}

- (NSInteger)numberOfEvents {
    return [self.events count];
}

- (id)eventAtIndex:(NSInteger)index {
    return [self.events objectAtIndex:index];
}

@end
