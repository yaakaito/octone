//
//  BGGlobalMenuUserView.h
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGUser.h"

#define kBGGlobalMenuUserViewDefaultSize    CGSizeMake(270, 44)

@interface BGGlobalMenuUserView : UIView
@property (nonatomic, strong) BGUser *user;
@end
