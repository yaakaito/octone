//
//  BGAuthenticationManager.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGUser.h"

extern NSString *kBGAuthenticationManagerDidOAuthSuccessNotification;
extern NSString *kBGAuthenticationManagerDidOAuthFailureNotification;

@interface BGAuthenticationManager : NSObject
@property (nonatomic, readonly) NSTimeInterval timeoutInterval;

+ (id)sharedManager;
- (BOOL)authenticated;
- (NSString *)accessToken;
- (void)startGithubOAuth;
- (void)githubOAuthWithCallbackURL:(NSURL*)url;
- (BGUser*)loginUser;
@end
