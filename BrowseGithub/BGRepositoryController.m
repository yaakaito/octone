//
//  BGRepositoryController.m
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGRepositoryController.h"

@interface BGRepositoryController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *_superHeaderView;
@end

@implementation BGRepositoryController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self._superHeaderView addSubview:self.headerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hogehogehoge:(id)sender {
    NSLog(@"a");
}
@end
