//
//  BGRepositoryHeaderView.m
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGRepositoryHeaderView.h"
#import "UIColor+BrowseGithub.h"
#import "UIFont+BrowseGithub.h"

@implementation BGRepositoryHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    self.forks.text = @"4";
    self.stars.text = @"112";
    
    self.language.font = [UIFont githubDefaultFontOfSize:12];
    self.language.textColor = [UIColor githubLightTextColor];
    
    self.stars.font = [UIFont boldDefaultFontOfSize:12];
    self.stars.textColor = [UIColor githubLightTextColor];
    
    self.forks.font = [UIFont boldDefaultFontOfSize:12];
    self.forks.textColor = [UIColor githubLightTextColor];
    
    self.backgroundColor = [UIColor githubLightBackgroundColor];
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
