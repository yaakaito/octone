//
//  BGRepositoryCell.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/23.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGBaseCell.h"

@class BGRepository;

@interface BGRepositoryCell : BGBaseCell
@property (nonatomic, strong) BGRepository *repository;
@end
