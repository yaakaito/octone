//
//  BGFeedEntryCell.h
//  BrowseGithub
//
//  Created by yaakaito on 12/08/30.
//
//

#import <UIKit/UIKit.h>

#define kBGFeedEntryCellReuseIdentifier     @"BGFeedEntryCell"

@interface BGFeedEntryCell : UITableViewCell
@property (nonatomic, strong) NSURL *gravatarUrl;
@property (nonatomic, strong) NSAttributedString *attributedTitle;
@end
