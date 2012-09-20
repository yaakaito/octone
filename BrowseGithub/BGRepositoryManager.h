//
//  BGRepositoryManager.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/19.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGResourceManager.h"

@class BGRepository;

@interface BGRepositoryManager : BGResourceManager

- (NSInteger)numberOfRepositories;
- (BGRepository*)repositoryAtIndex:(NSInteger)index;
@end
