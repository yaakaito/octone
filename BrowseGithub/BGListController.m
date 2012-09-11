//
//  BGListController.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGListController.h"
#import "BGTableView.h"
#import <SVPullToRefresh/SVPullToRefresh.h>

@interface BGListController ()

@end

@implementation BGListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {

    BGTableView *tableView = [[BGTableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.view = tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    __weak BGTableView *tableView = (BGTableView*)self.view;
    [tableView addPullToRefreshWithActionHandler:^{
        [self reloadData:^{
            [tableView.pullToRefreshView performSelectorOnMainThread:@selector(stopAnimating)
                                                          withObject:nil
                                                       waitUntilDone:NO];
        }];
    }];
    
    [tableView.pullToRefreshView triggerRefresh];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)reloadData:(void (^)(void))complete {
    complete();
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}


@end
