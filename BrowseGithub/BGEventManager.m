//
//  BGEventManager.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGEventManager.h"
#import "BGGithubResource.h"
#import "BGEvent.h"

@interface BGEventManager()
@property (nonatomic, strong) NSArray *currentEvents;
@property (nonatomic, strong) BGGithubResource *currentResource;
@end

@implementation BGEventManager

- (void)prepareLoginUserReceivedEvents {
    ;
}

- (void)reloadCurrentResource:(void (^)(BOOL))callback {
    
    if (!self.currentResource) {
        callback(NO);
        return;
    }
    
    [self.currentResource loadDataWithComplete:^{
        callback(YES);
    } failure:^{
        callback(NO);
    }];
}

- (NSInteger)numberOfEvents {
    return 0;
}

- (id)eventAtIndex:(NSInteger)index {
    return nil;
}
@end
