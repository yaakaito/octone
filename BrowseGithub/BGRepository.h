//
//  BGRepository.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/16.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGGithubResource.h"

@interface BGRepository : BGGithubResource

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *fullName;
@property (nonatomic, strong, readonly) NSString *language;
@property (nonatomic, strong, readonly) NSString *repositoryDescription;
@property (nonatomic, readonly) NSInteger watchers;
@property (nonatomic, readonly) NSInteger forks;
@property (nonatomic, readonly) BOOL fork;
@property (nonatomic, readonly) NSInteger openIssues;

+ (id)repositoryWithJSON:(id)json;
+ (id)repositorywithFullName:(id)fullName;
@end
