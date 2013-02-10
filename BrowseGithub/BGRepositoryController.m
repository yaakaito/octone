//
//  BGRepositoryController.m
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGRepositoryController.h"
#import "BGRepositoryView.h"

@interface BGRepositoryController ()
@end

@implementation BGRepositoryController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Overline";
    }
    return self;
}
/*
- (void)loadView
{
    self.view = [[BGRepositoryView alloc] initWithFrame:CGRectZero];
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hogehogehoge:(id)sender {
    NSLog(@"a");
}
@end
