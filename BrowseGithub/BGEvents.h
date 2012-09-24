//
//  BGEvents.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGGithubResource.h"

@class BGUser;

@interface BGEvents : BGGithubResource
@property (nonatomic, strong, readonly) NSArray *events;

+ (id)receivedEventsWithUser:(BGUser*)user;
@end
