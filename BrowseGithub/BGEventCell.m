//
//  BGEventCell.m
//  BrowseGithub
//
//  Created by yaakaito on 2012/09/26.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGEventCell.h"
#import "BGEventMessageFormatter.h"
#import "UIColor+BrowseGithub.h"
#import "UIFont+BrowseGithub.h"

@interface BGEventCell()
@property (nonatomic, strong) UILabel *message;
@property (nonatomic, strong) UILabel *eventDescription;
@end

@implementation BGEventCell

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBGEventCellReuseIdentifier];
    if (self) {
        
        self.message = [[UILabel alloc] init];
        self.message.numberOfLines = 2;
        self.message.lineBreakMode = NSLineBreakByCharWrapping;
        self.message.textColor = [UIColor githubTextColor];
        self.message.font = [UIFont boldDefaultFontOfSize:12];
        self.message.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.message];
        
        self.eventDescription = [[UILabel alloc] init];
        self.eventDescription.textColor = [UIColor githubLightTextColor];
        self.eventDescription.font = [UIFont githubDefaultFontOfSize:10];
        self.eventDescription.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.eventDescription];
    }
    return self;
}

- (void)setEvent:(BGEvent *)event {
    
    if (_event != event) {
        _event = event;
        self.message.attributedText = [BGEventMessageFormatter messageWithEvent:event];
        self.eventDescription.text = [BGEventMessageFormatter descriptionWithEvent:event];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.message.frame = CGRectMake(10, 5, 300, 35);
    self.eventDescription.frame = CGRectMake(15, 45, 290, 15);
}
@end
