//
//  BGRepositoryManager.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/19.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGGithubResource.h"

@class BGUser;

@interface BGRepositoryManager : BGGithubResource

- (void)prepareLoginUserRepositroies;
- (void)prepareWithUser:(BGUser*)user;
- (void)reloadCurrentResource:(void(^)(BOOL success))callback;
- (BOOL)loadNextPageResource:(void(^)(BOOL success))callback;
- (NSInteger)numberOfRepositories;

@end
