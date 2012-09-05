//
//  BGGlobalMenuContentCell.m
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGGlobalMenuContentCell.h"
#import "UIColor+BrowseGithub.h"

@interface BGGlobalMenuContentCell()
@property (nonatomic, strong) UIView *hightlighter;
@property (nonatomic, strong) UIView *separator;
@end

@implementation BGGlobalMenuContentCell

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:kGlobalMenuContentCellReuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor githubGlobalMenuBackgroundColor];
        self.contentView.backgroundColor = [UIColor githubGlobalMenuBackgroundColor];
        self.selectedBackgroundView = [[UIView alloc] init];
        self.selectedBackgroundView.backgroundColor = [UIColor githubHightlightedGlobalMenuBackgroundColor];
        self.hightlighter = [[UIView alloc] init];
        self.hightlighter.backgroundColor = [UIColor githubGlobalMenuHightlightColor];
        [self addSubview:self.hightlighter];
        self.separator = [[UIView alloc] init];
        self.separator.backgroundColor = [UIColor githubGlobalMenuSeparatorColor];
        [self addSubview:self.separator];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.hightlighter.frame = CGRectMake(0, 0, self.frame.size.width, 1);
    self.separator.frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
