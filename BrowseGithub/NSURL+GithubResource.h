//
//  NSURL+GithubResource.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//
//

#import <Foundation/Foundation.h>

@interface NSURL (GithubResource)
+ (id)githubApiURLWithPath:(NSString*)path auth:(BOOL)auth;
- (NSString*)threadId;
@end
