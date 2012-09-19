//
//  BGRepositories.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/16.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGRepositories.h"
#import "BGUser.h"
#import "NSURL+GithubResource.h"
#import "BGRepository.h"

@interface BGRepositories()
@property (nonatomic, strong) NSArray *repositories;
@end

@implementation BGRepositories

+ (id)repositoriesWithLoginUserPerPage:(NSUInteger)perPage forPage:(NSUInteger)page {
    NSString *path = [NSString stringWithFormat:@"/user/repos?per_page=%d&page=%d&sort=pushed", perPage, page];
    return [[self alloc] initWithUrl:[NSURL githubApiURLWithPath:path
                                                            auth:YES]];
}

+ (id)repositoriesWithUser:(BGUser *)user perPage:(NSUInteger)perPage forPage:(NSUInteger)page {
    NSString *path = [NSString stringWithFormat:@"/users/%@/repos?per_page=%d&page=%d&sort=pushed", user.login, perPage, page];
    return [[self alloc] initWithUrl:[NSURL githubApiURLWithPath:path
                                                            auth:NO]];
}

- (void)setValuesFromJSON:(id)json {
    
    if(![json isKindOfClass:[NSArray class]]) {
        return;
    }
    
    NSArray *jsonArray = json;
    NSMutableArray *repositories = [NSMutableArray array];
    for (id repositoryJSON in jsonArray) {
        BGRepository *repository = [[BGRepository alloc] initWithJSON:repositoryJSON];
        [repositories addObject:repository];
    }
    self.repositories = repositories;
    
}
@end
