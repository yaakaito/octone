//
//  BGUser.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/10.
//
//

#import "BGGithubResource.h"

@interface BGUser : BGGithubResource

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic) NSInteger followers;
@property (nonatomic) NSInteger following;
@property (nonatomic) NSInteger publicRepos;
@property (nonatomic, strong) NSURL *gravatarUrl;

+ (id)userWithUserName:(NSString*)userName;
+ (id)userWithLoginUser;
@end
