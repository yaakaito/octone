//
//  BGRepositoryCell.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/23.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGRepositoryCell.h"
#import "BGRepository.h"
#import "UIColor+BrowseGithub.h"
#import "UIFont+BrowseGithub.h"

@interface BGRepositoryCell()
@property (nonatomic, strong) UILabel *repositoryName;
@property (nonatomic, strong) UILabel *repositoryDescription;
@end

@implementation BGRepositoryCell

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBGRepositoryCellReuseIdentifier];
    if (self) {
        self.repositoryName = [[UILabel alloc] initWithFrame:CGRectZero];
        self.repositoryName.font = [UIFont boldDefaultFontOfSize:16];
        self.repositoryName.textColor = [UIColor githubTextColor];
        self.repositoryName.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.repositoryName];
    
        self.repositoryDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        self.repositoryDescription.font = [UIFont githubDefaultFontOfSize:12];
        self.repositoryDescription.textColor = [UIColor githubLightTextColor];
        self.repositoryDescription.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.repositoryDescription];
    }
    return self;
}

- (void)setRepository:(BGRepository *)repository {
    
    if(_repository != repository) {
        _repository = repository;
        self.repositoryName.text = repository.name;
        self.repositoryDescription.text = repository.repositoryDescription;
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.repositoryName.frame = CGRectMake(10, 5, 300, 40);
    self.repositoryDescription.frame = CGRectMake(15, 50, 290, 20);
}

@end
