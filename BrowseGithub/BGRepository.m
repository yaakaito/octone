//
//  BGRepository.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/16.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGRepository.h"
#import "NSURL+GithubResource.h"

@interface BGRepository()
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *repositoryDescription;
@property (nonatomic) NSInteger watchers;
@property (nonatomic) NSInteger forks;
@property (nonatomic) BOOL fork;
@property (nonatomic) BOOL isPrivate;
@property (nonatomic) NSInteger openIssues;
@end

@implementation BGRepository

+ (id)repositoryWithJSON:(id)json {
    NSString *path = [NSString stringWithFormat:@"/repos/%@", [json objectForKey:@"full_name"]];
    return [[self alloc] initWithUrl:[NSURL githubApiURLWithPath:path
                                                            auth:NO]
                                JSON:json];

}

+ (id)repositoryWithFullName:(id)fullName {
    NSString *path = [NSString stringWithFormat:@"/repos/%@", fullName];
    return [[self alloc] initWithUrl:[NSURL githubApiURLWithPath:path
                                                            auth:NO]];
}

- (void)setValuesFromJSON:(id)json {
    
    if(![json isKindOfClass:[NSDictionary class]]) {
        return;
    }
    NSDictionary *jsonDic = json;
    
    
    self.name = [jsonDic objectForKey:@"name"];
    self.fullName = [jsonDic objectForKey:@"full_name"];
    self.language = [jsonDic objectForKey:@"language"];
    self.repositoryDescription = [jsonDic objectForKey:@"description"];
    self.watchers = [[json objectForKey:@"watchers_count"] integerValue];
    self.forks = [[json objectForKey:@"forks_count"] integerValue];
    self.fork = [[json objectForKey:@"fork"] boolValue];
    self.isPrivate = [[json objectForKey:@"private"] boolValue];
    self.openIssues = [[json objectForKey:@"open_issues_count"] integerValue];
    
}

@end
