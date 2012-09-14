//
//  MockReceivedEvents.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/14.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "MockReceivedEvents.h"
#import "NSBundle+Specs.h"

@implementation MockReceivedEvents

- (id)initWithSuccess:(BOOL)success {
    self = [super initWithPath:@"/mock"];
    if (self) {
        self.success = success;
    }
    return self;
}

- (void)loadDataWithComplete:(void (^)(void))complete
                     failure:(void (^)(void))failure {
    
    if (self.success) {
        [self setValuesFromJSON:[NSBundle jsonObjectForResourceName:@"recevie_events"]];
        complete();
    }
    else {
        failure();
    }
}

@end
