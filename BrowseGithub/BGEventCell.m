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
#import "BGEvent.h"

#import <QuartzCore/QuartzCore.h>
#import <JMImageCache/JMImageCache.h>

@interface BGEventCell()
@property (nonatomic, strong) IBOutlet UILabel *message;
@property (nonatomic, strong) IBOutlet UILabel *eventDescription;
@property (nonatomic, strong) IBOutlet UIImageView *thumbnail;
@end

@implementation BGEventCell
/*
- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBGEventCellReuseIdentifier];
    if (self) {
        
        self.message = [[UILabel alloc] initWithFrame:CGRectZero];
        self.message.numberOfLines = 2;
        self.message.lineBreakMode = NSLineBreakByCharWrapping;
        self.message.textColor = [UIColor githubTextColor];
        self.message.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.message];
        
        self.eventDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        self.eventDescription.textColor = [UIColor githubLightTextColor];
        self.eventDescription.font = [UIFont githubDefaultFontOfSize:10];
        self.eventDescription.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.eventDescription];

        
        self.thumbnail = [[UIImageView alloc] initWithImage:nil];
        self.thumbnail.layer.cornerRadius = 3.0f;
        self.thumbnail.clipsToBounds = YES;
        [self.contentView addSubview:self.thumbnail];
        
    }
    return self;
}
*/

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    self.message.font = [UIFont boldDefaultFontOfSize:12];
    self.eventDescription.font = [UIFont githubDefaultFontOfSize:10];

}

- (void)setEvent:(BGEvent *)event {
    
    if (_event != event) {
        _event = event;
        
        self.message.attributedText = [BGEventMessageFormatter messageWithEvent:event];
        self.eventDescription.text = [BGEventMessageFormatter descriptionWithEvent:event];
        [self.thumbnail setImageWithURL:event.actorGravatarUrl];
    }
}
/*
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.message.frame = CGRectMake(self.contentView.frame.size.height - 8 + 10, 5, 240, 35);
    self.eventDescription.frame = CGRectMake(15, 45, 290, 15);
    self.thumbnail.frame = CGRectMake(4, 4, self.contentView.frame.size.height - 8, self.contentView.frame.size.height-8);
}
 */

@end
