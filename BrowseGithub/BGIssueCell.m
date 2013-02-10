//
//  BGIssueCell.m
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGIssueCell.h"

@interface BGIssueCell ()
@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *issueDescription;
@end

@implementation BGIssueCell


- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    self.title.font = [UIFont boldDefaultFontOfSize:16];
    self.title.textColor = [UIColor githubTextColor];

    
    self.issueDescription.font = [UIFont githubDefaultFontOfSize:12];
    self.issueDescription.textColor = [UIColor githubLightTextColor];

}

@end
