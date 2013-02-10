//
//  BGRepositoryHeaderView.h
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGRepositoryHeaderView : UIView
@property (nonatomic, weak) IBOutlet UILabel *language;
@property (nonatomic, weak) IBOutlet UILabel *stars;
@property (nonatomic, weak) IBOutlet UILabel *forks;
@end
