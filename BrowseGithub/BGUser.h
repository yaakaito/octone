//
//  BGUser.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/10.
//
//

#import "BGGithubResource.h"

@interface BGUser : BGGithubResource

- (id)initWithUserName:(NSString*)userName;
- (id)initWithLoginUser;
@end
