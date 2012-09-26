//
//  BGPageLoadingCell.m
//  BrowseGithub
//
//  Created by yaakaito on 2012/09/26.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGPageLoadingCell.h"
#import "UIColor+BrowseGithub.h"

@interface BGPageLoadingCell()
@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@end

@implementation BGPageLoadingCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBGPageLoadingCellReuseIdentifier];
    if (self) {
        // Initialization code
        self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectZero];
        self.indicator.color  = [UIColor githubRefhreshControlColor];
        self.indicator.backgroundColor = [UIColor clearColor];
        self.indicator.hidesWhenStopped = NO;
        self.indicator.hidden = NO;
        [self.contentView addSubview:self.indicator];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.indicator.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void)startIndicator {
    
    if (!self.indicator.isAnimating) {
        [self.indicator startAnimating];
    }
}
@end
