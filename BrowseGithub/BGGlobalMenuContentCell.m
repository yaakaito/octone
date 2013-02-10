//
//  BGGlobalMenuContentCell.m
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGGlobalMenuContentCell.h"
#import "UIColor+BrowseGithub.h"
#import "UIFont+BrowseGithub.h"

@interface BGGlobalMenuContentCell()
@property (nonatomic, strong) UIView *hightlighter;
@property (nonatomic, strong) UIView *separator;
@end

@implementation BGGlobalMenuContentCell


- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    [super willMoveToSuperview:newSuperview];
    
    // Initialization code
    self.backgroundColor = [UIColor githubGlobalMenuBackgroundColor];
    self.contentView.backgroundColor = [UIColor githubGlobalMenuBackgroundColor];
    self.selectedBackgroundView.backgroundColor = [UIColor githubHightlightedGlobalMenuBackgroundColor];
    self.hightlighter.backgroundColor = [UIColor githubGlobalMenuHightlightColor];
    self.separator.backgroundColor = [UIColor githubGlobalMenuSeparatorColor];
    self.textLabel.font = [UIFont heavyDefaultFontOfSize:16];
    self.textLabel.textColor = [UIColor githubPrimaryColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
