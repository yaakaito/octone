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
@property (nonatomic, strong) IBOutlet UILabel *repositoryName;
@property (nonatomic, strong) IBOutlet UILabel *repositoryDescription;
@property (nonatomic, strong) IBOutlet UILabel *stars;
@property (nonatomic, strong) IBOutlet UILabel *forks;
@end

@implementation BGRepositoryCell

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBGRepositoryCellReuseIdentifier];
    if (self) {
        self.repositoryName = [[UILabel alloc] initWithFrame:CGRectZero];
        self.repositoryName.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.repositoryName];
    
        self.repositoryDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        self.repositoryDescription.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.repositoryDescription];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    [super willMoveToSuperview:newSuperview];
    
    self.repositoryName.font = [UIFont boldDefaultFontOfSize:16];
    self.repositoryName.textColor = [UIColor githubTextColor];

    self.repositoryDescription.font = [UIFont githubDefaultFontOfSize:12];
    self.repositoryDescription.textColor = [UIColor githubLightTextColor];


}

- (void)setRepository:(BGRepository *)repository {
    
    if(_repository != repository) {
        _repository = repository;
        self.repositoryName.text = repository.name;
        self.repositoryDescription.text = repository.repositoryDescription;
        self.stars.text = [NSString stringWithFormat:@"%d", repository.watchers];
        self.forks.text = [NSString stringWithFormat:@"%d", repository.forks];
        
    }
}

@end
