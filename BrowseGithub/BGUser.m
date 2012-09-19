//
//  BGUser.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/10.
//
//

#import "BGUser.h"
#import "NSURL+GithubResource.h"

@implementation BGUser

+ (id)userWithUserName:(NSString *)userName {
    return [[self alloc] initWithUrl:[NSURL githubApiURLWithPath:[NSString stringWithFormat:@"/users/%@", userName]
                                                           auth:NO]];
}

+ (id)userWithLoginUser {
    return [[self alloc] initWithUrl:[NSURL githubApiURLWithPath:@"/user"
                                                           auth:YES]];
}

- (void)setValuesFromJSON:(id)json {
    
    if(![json isKindOfClass:[NSDictionary class]]) {
        return;
    }
    NSDictionary *jsonDic = json;
    
    self.login = [jsonDic objectForKey:@"login"];
    self.name = [jsonDic objectForKey:@"name"];
    self.email = [jsonDic objectForKey:@"email"];
    self.followers = [[jsonDic objectForKey:@"followers"] intValue];
    self.following = [[jsonDic objectForKey:@"following"] intValue];
    self.publicRepos = [[jsonDic objectForKey:@"public_repos"] intValue];
    self.gravatarUrl = [NSURL URLWithString:[jsonDic objectForKey:@"avatar_url"]];

}
@end
