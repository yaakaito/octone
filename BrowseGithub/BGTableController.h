//
//  BGTableController.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGTableController : UITableViewController

- (void)reloadData:(void(^)(void))complete;
@end
