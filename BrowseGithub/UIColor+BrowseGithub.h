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
+ (UIColor *)githubNavigationColor;
+ (UIColor *)githubBackgroundColor;
+ (UIColor *)githubGlobalMenuBacbkgroundColor;
+ (UIColor *)githubSectionBbackgroundColor;

#pragma mark - Colors
+ (UIColor *)githubPrimaryColor;
+ (UIColor *)githubSecondaryColor;
+ (UIColor *)githubComplementaryColor;

#pragma mark - Decorations
+ (UIColor *)githubHightlightedBackgroundColor;
+ (UIColor *)githubHightlightColor;
+ (UIColor *)githubSeparatorColor;

@end
