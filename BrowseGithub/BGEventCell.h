//
//  BGEventCell.h
//  BrowseGithub
//
//  Created by yaakaito on 2012/09/26.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGBaseCell.h"

#define kBGEventCellReuseIdentifier @"BGEventCellReuseIdentifier"
#define kBGEventCellHeight  64

@class BGEvent;

@interface BGEventCell : BGBaseCell
@property (nonatomic, strong) BGEvent *event;
@end
