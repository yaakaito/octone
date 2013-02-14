//
//  BGWebView.m
//  octone
//
//  Created by yaakaito on 2013/02/15.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGWebView.h"

@implementation BGWebView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    self.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    
    self.backgroundColor = [UIColor githubBackgroundColor];
    self.opaque = NO;
    for(UIView *wview in [[[self subviews] objectAtIndex:0] subviews]) {
        if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; }
    }
    
}


@end
