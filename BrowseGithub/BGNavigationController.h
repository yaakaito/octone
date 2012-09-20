//
//  BGNavigationController.h
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGGlobalMenuControllerDelegate.h"

#define kBGNavigationControllerDidChangeControllerNotification  (@"BGNavigationControllerDidChangeControllerNotification")

@interface BGNavigationController : UINavigationController<BGGlobalMenuControllerDelegate>

@end
