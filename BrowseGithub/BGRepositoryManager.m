//
//  BGRepositoryManager.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/19.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGRepositoryManager.h"
#import "BGRepositories.h"
#import "BGRepository.h"

@interface BGRepositoryManager()
@property (nonatomic, strong) NSMutableArray *repositories;
@end

@implementation BGRepositoryManager

- (void)setResourcesFromResource:(BGGithubResource *)resource reload:(BOOL)reload {
    
    BGRepositories *repositories = (BGRepositories*)resource;
    if (reload) {
        self.repositories = [repositories.repositories mutableCopy];
    }
    else {
        [self.repositories addObjectsFromArray:repositories.repositories];
    }
}

- (NSInteger)numberOfRepositories {
    return [self.repositories count];
}

- (BGRepository *)repositoryAtIndex:(NSInteger)index {
    return [self.repositories objectAtIndex:index];
}
@end
