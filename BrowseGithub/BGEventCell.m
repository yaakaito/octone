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


@end
