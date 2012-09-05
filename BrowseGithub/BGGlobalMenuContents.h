//
//  BGGlobalMenuContents.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGGlobalMenuContents : NSObject
+ (id)sharedContents;
- (NSString*)contentsTitleForIndex:(NSInteger)index;
- (id)contentsControllerForIndex:(NSInteger)index;
- (NSInteger)numberOfContents;
@end
