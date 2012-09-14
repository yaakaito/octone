//
//  BGListController.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGListController.h"
#import "BGTableView.h"
#import "UIColor+BrowseGithub.h"

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

    [super loadView];
    BGTableView *tableView = [[BGTableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor githubRefhreshControlColor];
    [refreshControl addTarget:self
                       action:@selector(refreshControlValueChanged:)
             forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = refreshControl;
    
    [refreshControl beginRefreshing];
    [self refreshControlValueChanged:refreshControl];
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

- (void)refreshControlValueChanged:(UIRefreshControl*)sender {

    if(sender.refreshing) {
        [self reloadData:^{
            [sender endRefreshing];
            [self.tableView reloadData];
        }];
    }
}

- (void)reloadData:(void (^)(void))complete {
    complete();
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}


@end
