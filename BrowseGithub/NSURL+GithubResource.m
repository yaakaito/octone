//
//  NSURL+GithubResource.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//
//

#import "NSURL+GithubResource.h"
#import "BGAuthenticationManager.h"
#import "BrowseGithub.h"

@implementation NSURL (GithubResource)

+ (id)githubApiURLWithPath:(NSString *)path auth:(BOOL)auth {
    
    NSMutableString *urlString = [[NSMutableString alloc] initWithFormat:@"%@%@", [BrowseGithub apiBaseUrlString], path];
    [[urlString substringFromIndex:[urlString length]-1] isEqualToString:@"?"];
    if (auth) {
        NSString *token = [[BGAuthenticationManager sharedManager] accessToken];
        NSURL *pathURL = [NSURL URLWithString:path];
        if ([[pathURL query] length] > 0) {
            [urlString appendFormat:@"&access_token=%@", token];
        }
        else {
            [urlString appendFormat:@"?access_token=%@", token];
        }
    }
    
    return [NSURL URLWithString:urlString];
}

- (NSString *)threadId {
    
    return [[[self relativePath] componentsSeparatedByString:@"/"] lastObject];
}


@end
