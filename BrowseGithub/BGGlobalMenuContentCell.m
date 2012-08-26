//
//  BGGlobalMenuContentCell.m
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGGlobalMenuContentCell.h"

@implementation BGGlobalMenuContentCell

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:kGlobalMenuContentCellReuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor darkGrayColor];
        self.contentView.backgroundColor = [UIColor darkGrayColor];
        self.selectedBackgroundView.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
