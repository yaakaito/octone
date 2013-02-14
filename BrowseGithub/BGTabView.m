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

- (void)_displayViewForIndex:(NSUInteger)index
{
    UIView *view = [self.delegate viewForIndex:index];
    view.frame = self.bodyArea.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.bodyArea addSubview:view];
}

- (IBAction)selectedTabIndex:(UISegmentedControl *)sender
{
    [self _displayViewForIndex:sender.selectedSegmentIndex];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    [self _displayViewForIndex:0];
}

@end
