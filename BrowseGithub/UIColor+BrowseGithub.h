//
//  UIColor+BrowseGithub.h
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BrowseGithub)

#pragma mark - Base texts
+ (UIColor *)githubTextColor;
+ (UIColor *)githubLightTextColor;

#pragma mark - Base backgrounds
+ (UIColor *)githubBackgroundColor;
+ (UIColor *)githubLightBackgroundColor;
+ (UIColor *)githubHightlightedBackgroundColor;
+ (UIColor *)githubGlobalMenuBackgroundColor;
+ (UIColor *)githubHightlightedGlobalMenuBackgroundColor;
+ (UIColor *)githubSectionBackgroundColor;

#pragma mark - Colors
+ (UIColor *)githubPrimaryColor;
+ (UIColor *)githubPrimaryDarkColor;
+ (UIColor *)githubSecondaryColorA;
+ (UIColor *)githubSecondaryDarkColorA;
+ (UIColor *)githubSecondaryColorB;
+ (UIColor *)githubSecondaryDarkColorB;
+ (UIColor *)githubComplementaryColor;
+ (UIColor *)githubComplementaryDarkColor;

#pragma mark - Decorations
+ (UIColor *)githubHightlightColor;
+ (UIColor *)githubSeparatorColor;
+ (UIColor *)githubGlobalMenuHightlightColor;
+ (UIColor *)githubGlobalMenuSeparatorColor;

#pragma mark - Refresh
+ (UIColor *)githubRefhreshControlColor;

@end
