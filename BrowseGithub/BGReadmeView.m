//
//  BGReadmeView.m
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGReadmeView.h"

@implementation BGReadmeView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    self.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    
    self.backgroundColor = [UIColor githubBackgroundColor];
    self.opaque = NO;
    for(UIView *wview in [[[self subviews] objectAtIndex:0] subviews]) {
        if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; }
    }
    
    [self displayHTMLString:[[NSMutableString alloc] initWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"readme" ofType:@"html"]]
                                                         encoding:NSUTF8StringEncoding]];
}

- (void)displayHTMLString:(NSString *)htmlString
{
    [self loadHTMLString:htmlString baseURL:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
