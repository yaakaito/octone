//
//  BGRepositoryCell.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/23.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGRepositoryCell.h"

@interface BGRepositoryCell()
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *repositoryDescription;
@property (nonatomic, strong) UILabel *lastUpdateAt;
@end

@implementation BGRepositoryCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setRepository:(BGRepository *)repository {
    
    if(_repository != repository) {
        _repository = repository;
        
    }
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
