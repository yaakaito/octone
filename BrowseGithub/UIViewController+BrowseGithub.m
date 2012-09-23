//
//  UIViewController+BrowseGithub.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/23.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "UIViewController+BrowseGithub.h"

@implementation UIViewController (BrowseGithub)

- (void)assignBackBarButtonForTargetViewController:(UIViewController *)viewController {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"back-button"] forState:UIControlStateNormal];
    [button addTarget:viewController action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 30, 30);
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    viewController.navigationItem.leftBarButtonItem = item;
    
}

- (void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
