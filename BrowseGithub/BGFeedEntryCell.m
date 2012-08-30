//
//  BGFeedEntryCell.m
//  BrowseGithub
//
//  Created by yaakaito on 12/08/30.
//
//

#import "BGFeedEntryCell.h"
#import "BGGravatarImageView.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>

@interface BGFeedEntryCell()
@property (nonatomic, strong) BGGravatarImageView *gravatarImageView;
@property (nonatomic, strong) TTTAttributedLabel *attributedTitleLabel;
@end

@implementation BGFeedEntryCell

- (id)init {
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBGFeedEntryCellReuseIdentifier];
    if (self) {
        // Initialization code
        self.gravatarImageView = [[BGGravatarImageView alloc] initWithDefaultImage];
        self.attributedTitleLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
    }
    return self;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
