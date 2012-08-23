//
//  BGAppDelegate.h
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/07/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"

@class BGViewController;

@interface BGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) JASidePanelController *viewController;

@end
