//
//  BGDiscussionController.m
//  octone
//
//  Created by yaakaito on 2013/02/12.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGDiscussionController.h"
#import "BGTabView.h"
#import "BGCommentsView.h"


@interface BGDiscussionController () <BGTabViewDelegate>

@end

@implementation BGDiscussionController

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
    BGTabView *tabView = (BGTabView *)self.view;
    tabView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForIndex:(NSUInteger)index
{
    return [[BGCommentsView alloc] init];
}
@end
