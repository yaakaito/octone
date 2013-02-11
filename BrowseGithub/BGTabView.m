//
//  BGTabView.m
//  octone
//
//  Created by yaakaito on 2013/02/12.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGTabView.h"

@interface BGTabView ()
@property (nonatomic, weak) IBOutlet UISegmentedControl *tab;
@property (nonatomic, weak) IBOutlet UIView *bodyArea;
@end

@implementation BGTabView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UIView *)viewForIndex:(NSUInteger)index
{
    NSLog(@"%u", index);
    return nil;
}

- (IBAction)selectedTabIndex:(UISegmentedControl *)sender
{
    [self viewForIndex:sender.selectedSegmentIndex];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    [self viewForIndex:0];
}

@end
