//
//  UIFont+BrowseGithub.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/02.
//
//

#import "UIFont+BrowseGithub.h"

@implementation UIFont (BrowseGithub)

+ (UIFont *)openSansFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"OpenSans" size:size];
}

+ (UIFont *)boldOpenSansFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"OpenSans-Bold" size:size];
}

@end
