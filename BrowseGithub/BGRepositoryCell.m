//
//  BGRepositoryCell.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/23.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGRepositoryCell.h"
#import "BGRepository.h"

@interface BGRepositoryCell()
@property (nonatomic, strong) IBOutlet UILabel *repositoryName;
@property (nonatomic, strong) IBOutlet UILabel *repositoryDescription;
@property (nonatomic, strong) IBOutlet UILabel *language;
@property (nonatomic, strong) IBOutlet UILabel *stars;
@property (nonatomic, strong) IBOutlet UILabel *forks;
@property (nonatomic, strong) IBOutlet UIImageView *repositoryStateIcon;
@end

@implementation BGRepositoryCell

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    [super willMoveToSuperview:newSuperview];
    
    self.repositoryName.font = [UIFont boldDefaultFontOfSize:16];
    self.repositoryName.textColor = [UIColor githubTextColor];

    self.repositoryDescription.font = [UIFont githubDefaultFontOfSize:12];
    self.repositoryDescription.textColor = [UIColor githubLightTextColor];
    
    self.language.font = [UIFont githubDefaultFontOfSize:12];
    self.language.textColor = [UIColor githubLightTextColor];
    
    self.stars.font = [UIFont boldDefaultFontOfSize:12];
    self.stars.textColor = [UIColor githubLightTextColor];

    self.forks.font = [UIFont boldDefaultFontOfSize:12];
    self.forks.textColor = [UIColor githubLightTextColor];


}

- (void)setRepository:(BGRepository *)repository {
    
    if(_repository != repository) {
        _repository = repository;
        self.repositoryName.text = repository.name;
        self.repositoryDescription.text = repository.repositoryDescription;
        self.stars.text = [NSString stringWithFormat:@"%d", repository.watchers];
        self.forks.text = [NSString stringWithFormat:@"%d", repository.forks];
        if (repository.isPrivate) {
            self.repositoryStateIcon.image = [UIImage imageNamed:@"private"];
        }
        else if (repository.fork) {
            self.repositoryStateIcon.image = [UIImage imageNamed:@"fork"];
        }
        else {
            self.repositoryStateIcon.image = [UIImage imageNamed:@"repository"];
        }
    }
}

@end
