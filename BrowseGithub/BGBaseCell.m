//
//  BGBaseCell.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//
//

#import "BGBaseCell.h"
#import "UIColor+BrowseGithub.h"
#import "UIFont+BrowseGithub.h"

@implementation BGBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    // Initialization code
    self.backgroundColor = [UIColor githubBackgroundColor];
    self.contentView.backgroundColor = [UIColor githubBackgroundColor];
    self.selectedBackgroundView = [[UIView alloc] init];
    self.selectedBackgroundView.backgroundColor = [UIColor githubHightlightedBackgroundColor];
    self.hightlighter = [[UIView alloc] init];
    self.hightlighter.backgroundColor = [UIColor githubHightlightColor];
    [self addSubview:self.hightlighter];
    self.separator = [[UIView alloc] init];
    self.separator.backgroundColor = [UIColor githubSeparatorColor];
    [self addSubview:self.separator];
    self.textLabel.font = [UIFont boldDefaultFontOfSize:12];
    self.textLabel.textColor = [UIColor githubTextColor];
    
    self.hightlighter.frame = CGRectMake(0, 0, self.frame.size.width, 1);
    self.separator.frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
