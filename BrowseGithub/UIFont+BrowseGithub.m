//
//  UIFont+BrowseGithub.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/02.
//
//

#import "UIFont+BrowseGithub.h"

@implementation UIFont (BrowseGithub)

+ (UIFont *)githubDefaultFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"mplus-2c-regular" size:size];
}

+ (UIFont *)boldDefaultFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"mplus-2c-bold" size:size];
}

+ (UIFont *)heavyDefaultFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"mplus-2c-heavy" size:size];
}
@end
