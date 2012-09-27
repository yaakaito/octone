//
//  BGPageLoadingCell.h
//  BrowseGithub
//
//  Created by yaakaito on 2012/09/26.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGBaseCell.h"

#define kBGPageLoadingCellReuseIdentifier @"BGPageLoadingCellReuseIdentifier"

@interface BGPageLoadingCell : BGBaseCell
- (void)startIndicator;
- (void)showComplete;
@end
