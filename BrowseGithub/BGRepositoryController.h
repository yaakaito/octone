//
//  BGRepositoryController.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/21.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGTableController.h"

@class BGRepository;

@interface BGRepositoryController : BGTableController

- (id)initWithRepository:(BGRepository*)repository;
@end