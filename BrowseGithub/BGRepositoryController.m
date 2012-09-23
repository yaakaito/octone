//
//  BGRepositoryController.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/21.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGRepositoryController.h"
#import "BGRepository.h"
#import "BGBaseCell.h"

@interface BGRepositoryController ()
@property (nonatomic, strong) BGRepository *repository;
@end

@implementation BGRepositoryController

- (id)initWithRepository:(BGRepository *)repository {
    
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.repository = repository;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = self.repository.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BGBaseCell *cell = [[BGBaseCell alloc] init];
    cell.textLabel.text = self.repository.name;
    return cell;
}

@end
