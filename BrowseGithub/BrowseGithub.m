//
//  BrowseGithub.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/01.
//
//

#import "BrowseGithub.h"

@implementation BrowseGithub

+ (BOOL)authenticated {

    return YES;
}

+ (NSString *)apiBaseUrlString {
    return @"https://api.github.com";
}

@end
