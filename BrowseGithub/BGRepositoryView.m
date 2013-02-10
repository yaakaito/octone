//
//  BGRepositoryView.m
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGRepositoryView.h"
#import "UIColor+BrowseGithub.h"
#import "BGReadmeView.h"

@implementation BGRepositoryView

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
    
    [self._superHeaderView addSubview:self.headerView];

    
    self.backgroundColor = [UIColor githubBackgroundColor];
    
    
    BGReadmeView *readme = [[BGReadmeView alloc] initWithFrame:self._bodyAreaView.bounds];
    [self._bodyAreaView addSubview:readme];
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
