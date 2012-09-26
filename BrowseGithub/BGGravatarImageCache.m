//
//  BGGravatarImageCache.m
//  BrowseGithub
//
//  Created by yaakaito on 2012/09/26.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGGravatarImageCache.h"

@implementation BGGravatarImageCache

+ (id)sharedCache {
    
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;    
}


@end
