//
//  BGDiscussionView.m
//  octone
//
//  Created by yaakaito on 2013/02/12.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGDiscussionView.h"

@implementation BGDiscussionView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    self.discussionId.font = [UIFont githubDefaultFontOfSize:14];
    self.discussionId.textColor = [UIColor githubLightTextColor];
    
    self.title.font = [UIFont boldDefaultFontOfSize:14];
    self.title.textColor = [UIColor githubTextColor];
    
}

@end
