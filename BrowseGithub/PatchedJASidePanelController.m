//
//  PatchedJASidePanelController.m
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PatchedJASidePanelController.h"
#import <QuartzCore/QuartzCore.h>

@implementation PatchedJASidePanelController

+ (UIImage *)browseGithubImage {

    return [UIImage imageNamed:@"menu-button"];
}

+ (UIImage *)browseGithubImageHighlighted {
    
    return [UIImage imageNamed:@"menu-button-highlighted"];
}

#pragma mark - corner radius pathces
- (void)styleContainer:(UIView *)container animate:(BOOL)animate duration:(NSTimeInterval)duration {
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:container.bounds cornerRadius:0.0f];
    if (animate) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
        animation.fromValue = (id)container.layer.shadowPath;
        animation.toValue = (id)shadowPath.CGPath;
        animation.duration = duration;
        [container.layer addAnimation:animation forKey:@"shadowPath"];
    }
    container.layer.shadowPath = shadowPath.CGPath;	
    container.layer.shadowColor = [UIColor blackColor].CGColor;
    if(self.centerPanel.view == container) {
        container.layer.shadowRadius = 2.0f;
    }
    container.layer.shadowOpacity = 0.75f;
    container.clipsToBounds = NO;
}

- (void)stylePanel:(UIView *)panel {
    if(self.centerPanel.view == panel) {
        panel.layer.cornerRadius = 2.0f;
    }
    panel.clipsToBounds = YES;
}

- (UIBarButtonItem *)leftButtonForCenterPanel {

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button setImage:[[self class] browseGithubImage] forState:UIControlStateNormal];
    [button setImage:[[self class] browseGithubImageHighlighted] forState:UIControlStateSelected];
    [button setImage:[[self class] browseGithubImageHighlighted] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(toggleLeftPanel:) forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}



@end
