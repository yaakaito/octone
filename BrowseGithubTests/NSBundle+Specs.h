//
//  NSBundle+Specs.h
//  BrowseGithub
//
//  Created by yaakaito on 12/08/28.
//
//

#import <Foundation/Foundation.h>

@interface NSBundle (Specs)

+ (NSData *)atomForResourceName:(NSString*)resourceName;
+ (NSData *)jsonForResourceName:(NSString*)resourceName;
+ (id)jsonObjectForResourceName:(NSString*)resourceName;
@end
