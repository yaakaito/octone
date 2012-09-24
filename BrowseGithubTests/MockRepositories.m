//
//  MockRepositories.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/24.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "MockRepositories.h"
#import "NSBundle+Specs.h"

@implementation MockRepositories

- (void)loadDataWithComplete:(void (^)(void))complete
                     failure:(void (^)(void))failure {
    
    [self setValuesFromJSON:[NSBundle jsonObjectForResourceName:@"user.repos"]];
    complete();
}

@end
