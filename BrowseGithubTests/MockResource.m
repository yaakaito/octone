//
//  MockResource.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/20.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "MockResource.h"

@implementation MockResource

- (void)loadDataWithComplete:(void (^)(void))complete
                     failure:(void (^)(void))failure {
    
    if (self.success) {
        complete();
    }
    else {
        failure();
    }
}

@end
