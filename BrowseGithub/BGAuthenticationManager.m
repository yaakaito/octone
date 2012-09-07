//
//  BGAuthenticationManager.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGAuthenticationManager.h"
#import "BGSecretKeys.h"

NSString *kBGAuthenticationManagerDidOAuthSuccessNotification = @"BGAuthenticationManagerDidOAuthSuccessNotification";
NSString *kBGAuthenticationManagerDidOAuthFailureNotification = @"BGAuthenticationManagerDidOAuthFailureNotification";

@interface BGAuthenticationManager()
@end

@implementation BGAuthenticationManager

+ (id)sharedManager {
    
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;    
}

- (NSString *)accessToken {
    return kDebugAccessKey;
}
@end
