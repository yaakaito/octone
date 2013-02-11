//
//  BGPullRequestCell.m
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGPullRequestCell.h"

@interface BGPullRequestCell ()
@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *pullRequestDescription;
@end

@implementation BGPullRequestCell

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    self.title.font = [UIFont boldDefaultFontOfSize:16];
    self.title.textColor = [UIColor githubTextColor];
    
    
    self.pullRequestDescription.font = [UIFont githubDefaultFontOfSize:12];
    self.pullRequestDescription.textColor = [UIColor githubLightTextColor];
    
}

@end
