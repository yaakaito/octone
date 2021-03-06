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
    
    [self displayHTMLString:[[NSMutableString alloc] initWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"readme" ofType:@"html"]]
                                                         encoding:NSUTF8StringEncoding]];
}

- (void)displayHTMLString:(NSString *)htmlString
{
    [self loadHTMLString:htmlString baseURL:nil];
}


@end
