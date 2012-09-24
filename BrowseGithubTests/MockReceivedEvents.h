//
//  MockReceivedEvents.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/14.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGEvents.h"

@interface MockReceivedEvents : BGEvents

@property (nonatomic) BOOL success;

- (id)initWithSuccess:(BOOL)success;

@end
