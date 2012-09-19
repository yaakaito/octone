//
//  BGRepositories.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/16.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGGithubResource.h"

@class BGUser;

@interface BGRepositories : BGGithubResource

@property (nonatomic, strong, readonly) NSArray *repositories;

+ (id)repositoriesWithLoginUserPerPage:(NSUInteger)perPage forPage:(NSUInteger)page;
+ (id)repositoriesWithUser:(BGUser*)user perPage:(NSUInteger)perPage forPage:(NSUInteger)page;
@end
