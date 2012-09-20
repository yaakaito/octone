//
//  BGResourceManager.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/20.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGResourceManager.h"
#import "BGGithubResource.h"

@implementation BGResourceManager

- (void)loadResource:(BGGithubResource *)resource
            complete:(void (^)())complete
             failure:(void (^)())failure
              reload:(BOOL)reload
{
    [resource loadDataWithComplete:^{
        [self setResourcesFromResource:resource
                                reload:reload];
        complete();
    } failure:^{
        failure();
    }];
}

- (void)reloadResource:(BGGithubResource *)resource
              complete:(void (^)())complete
               failure:(void (^)())failure
{
    [self loadResource:resource
              complete:complete
               failure:failure
                reload:YES];
}

- (void)addResource:(BGGithubResource *)resource
           complete:(void (^)())complete
            failure:(void (^)())failure
{
    [self loadResource:resource
              complete:complete
               failure:failure
                reload:NO];
}

- (void)setResourcesFromResource:(BGGithubResource *)resource reload:(BOOL)reload {
    ;
}

@end
