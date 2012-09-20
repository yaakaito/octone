//
//  BGResourceManager.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/20.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BGGithubResource;

@interface BGResourceManager : NSObject

- (void)reloadResource:(BGGithubResource *)resource
              complete:(void (^)())complete
               failure:(void (^)())failure;

- (void)addResource:(BGGithubResource *)resource
           complete:(void (^)())complete
            failure:(void (^)())failure;

- (void)setResourcesFromResource:(BGGithubResource *)resource
                          reload:(BOOL)reload;

@end
