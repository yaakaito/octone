//
//  BGGlobalMenuContentCell.h
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGBaseCell.h"
#import "BGMenuContents.h"

#define kGlobalMenuContentCellReuseIdentifier (@"GlobalMenuContentCell")

@interface BGGlobalMenuContentCell : BGBaseCell

@property BGMenuContents *menuContents;

@end
