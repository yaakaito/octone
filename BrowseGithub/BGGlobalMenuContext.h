//
//  BGGlobalMenuContents.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGMenuContents.h"

@interface BGGlobalMenuContext : NSObject
+ (id)sharedContents;
- (BGMenuContents *)contentsForIndex:(NSInteger)index;
- (id)contentsControllerForIndex:(NSInteger)index;
- (NSInteger)numberOfContents;
@end
