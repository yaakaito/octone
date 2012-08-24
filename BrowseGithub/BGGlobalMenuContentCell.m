//
//  BGGlobalMenuContentCell.m
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGGlobalMenuContentCell.h"

NSString *kGlobalMenuContentCellReuseIdentifier = @"GlobalMenuContentCell";

@implementation BGGlobalMenuContentCell

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:kGlobalMenuContentCellReuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
