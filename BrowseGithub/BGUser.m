//
//  BGUser.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/10.
//
//

#import "BGUser.h"

@implementation BGUser

- (id)initWithUserName:(NSString *)userName {
    
    self = [super initWithPath:[NSString stringWithFormat:@"/users/%@", userName]];
    if (self) {
        
    }
    
    return self;
}

- (id)initWithLoginUser {
    
    self = [super initWithAuthAndPath:@"/user"];
    if (self) {
        
    }
    
    return self;
}

- (void)setValuesFromJSON:(id)json {
    
    if(![json isKindOfClass:[NSDictionary class]]) {
        return;
    }
    NSDictionary *jsonDic = json;
    
    self.login = [jsonDic objectForKey:@"login"];
    self.email = [jsonDic objectForKey:@"email"];
    self.followers = [[jsonDic objectForKey:@"followers"] intValue];
    self.following = [[jsonDic objectForKey:@"following"] intValue];
    self.publicRepos = [[jsonDic objectForKey:@"public_repos"] intValue];
    self.gravatarUrl = [NSURL URLWithString:[jsonDic objectForKey:@"avatar_url"]];

}
@end
