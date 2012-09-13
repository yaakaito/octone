//
//  BrowseGithub.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/01.
//
//

#import <Foundation/Foundation.h>

@interface BrowseGithub : NSObject

+ (BOOL)authenticated;
+ (NSString*)apiBaseUrlString;
@end
