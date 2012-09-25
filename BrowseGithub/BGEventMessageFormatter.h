//
//  BGEventMessageFormatter.h
//  BrowseGithub
//
//  Created by yaakaito on 2012/09/25.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BGEvent;

@interface BGEventMessageFormatter : NSObject

+ (NSAttributedString *)messageWithEvent:(BGEvent*)event;
+ (NSString*)descriptionWithEvent:(BGEvent*)event;
@end
