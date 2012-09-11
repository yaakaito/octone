//
//  UIApplication+Spec.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/11.
//
//

#import <UIKit/UIKit.h>

@interface UIApplication (Spec)
@property (nonatomic, strong) NSURL *openedURL;

- (void)swapOpenURL;
@end
