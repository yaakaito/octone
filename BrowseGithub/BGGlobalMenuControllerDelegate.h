//
//  BGGlobalMenuViewControllerDelegate.h
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BGGlobalMenuControllerDelegate
- (void)globalMenuController:(id)sender didSelectNextViewController:(UIViewController*)viewController;
@end
