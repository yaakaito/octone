//
//  UIColor+BrowseGithub.m
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIColor+BrowseGithub.h"

@implementation UIColor (BrowseGithub)

#pragma mark - Base texts
+ (UIColor *)githubTextColor {
    return [UIColor colorWithWhite:0.15 alpha:1.0];
}

+ (UIColor *)githubLightTextColor {
    return [UIColor colorWithWhite:0.35 alpha:1.0f];
}

#pragma mark - Base backgrounds
+ (UIColor *)githubBackgroundColor {
    return [UIColor colorWithWhite:0.92 alpha:1.0];
}

+ (UIColor *)githubHightlightedBackgroundColor {
    return [UIColor colorWithWhite:0.88 alpha:1.0];
}

+ (UIColor *)githubGlobalMenuBackgroundColor {
    return [UIColor colorWithWhite:0.18 alpha:1.0];
}

+ (UIColor *)githubHightlightedGlobalMenuBackgroundColor {
    return [UIColor colorWithWhite:0.08 alpha:1.0];
}

+ (UIColor *)githubSectionBackgroundColor {
    return [UIColor colorWithWhite:0.06 alpha:1.0];
}

#pragma mark - Colors
+ (UIColor *)githubPrimaryColor {
    return [UIColor colorWithRed:255.0/255.0 green:184.0/255.0 blue:0.0/255.0 alpha:1.0f];
}

+ (UIColor *)githubPrimaryDarkColor {
    return [UIColor colorWithRed:166.0/255.0 green:120.0/255.0 blue:0.0/255.0 alpha:1.0f];
}

+ (UIColor *)githubSecondaryColorA {
    return [UIColor colorWithRed:255.0/255.0 green:225.0/255.0 blue:0.0/255.0 alpha:1.0f];
}

+ (UIColor *)githubSecondaryDarkColorA {
    return [UIColor colorWithRed:166.0/255.0 green:146.0/255.0 blue:0.0/255.0 alpha:1.0f];
}

+ (UIColor *)githubSecondaryColorB {
    return [UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:0.0/255.0 alpha:1.0f];
}

+ (UIColor *)githubSecondaryDarkColorB {
    return [UIColor colorWithRed:166.0/255.0 green:89.0/255.0 blue:0.0/255.0 alpha:1.0f];
}

+ (UIColor *)githubComplementaryColor {
    return [UIColor colorWithRed:23.0/255.0 green:41.0/255.0 blue:176.0/255.0 alpha:1.0f];
}

+ (UIColor *)githubComplementaryDarkColor {
    return [UIColor colorWithRed:8.0/255.0 green:20.0/255.0 blue:114.0/255.0 alpha:1.0f];
}

#pragma mark - Decorations
+ (UIColor *)githubHightlightColor {
    return [UIColor colorWithWhite:0.98 alpha:1.0];
}

+ (UIColor *)githubSeparatorColor {
    return [UIColor colorWithWhite:0.84 alpha:1.0];
}

+ (UIColor *)githubGlobalMenuHightlightColor {
    return [UIColor colorWithWhite:0.16 alpha:1.0];
}

+ (UIColor *)githubGlobalMenuSeparatorColor {
    
    return [UIColor colorWithWhite:0.08 alpha:1.0];
}

+ (UIColor *)githubRefhreshControlColor {
    return [UIColor colorWithWhite:0.35 alpha:1.0];
}
@end
