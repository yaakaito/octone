//
//  BGCommentsView.m
//  octone
//
//  Created by yaakaito on 2013/02/15.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGCommentsView.h"

@implementation BGCommentsView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    [self displayHTMLString:[[NSMutableString alloc] initWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"comments" ofType:@"html"]]
                                                         encoding:NSUTF8StringEncoding]];
}

- (void)displayHTMLString:(NSString *)htmlString
{
    [self loadHTMLString:htmlString baseURL:nil];
}

@end
