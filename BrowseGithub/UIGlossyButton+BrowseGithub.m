//
//  UIGlossyButton+BrowseGithub.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/02.
//
//

#import "UIGlossyButton+BrowseGithub.h"
#import "UIColor+BrowseGithub.h"
#import "UIFont+BrowseGithub.h"

@implementation UIGlossyButton (BrowseGithub)

+ (UIGlossyButton *)githubDefaultStyleButtonWithTitle:(NSString *)title color:(UIColor *)color {
    UIGlossyButton *button = [[UIGlossyButton alloc] initWithFrame:CGRectZero];
    [button useWhiteLabel:YES];
    button.buttonCornerRadius = 2.0;
    button.buttonBorderWidth = 1.0f;
    [button setStrokeType: kUIGlossyButtonStrokeTypeBevelUp];
    button.tintColor = color;
    button.borderColor = color;
    button.titleLabel.font = [UIFont boldOpenSansFontOfSize:14];
    button.titleLabel.textColor = [UIColor githubTextColor];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}
@end
