//
//  BGRepositoryView.m
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGRepositoryView.h"
#import "BGReadmeView.h"

@implementation BGRepositoryView


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
    
}

@end
