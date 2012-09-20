//
//  BGEventManager.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGResourceManager.h"

@interface BGEventManager : BGResourceManager

- (NSInteger)numberOfEvents;
- (id)eventAtIndex:(NSInteger)index;

@end
