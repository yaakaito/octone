//
//  BGGlobalMenuContents.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGGlobalMenuContents.h"
#import "BGEventsController.h"
#import "BGRepositoriesController.h"

enum Contents {
    kIndexOfNewsFeeds = 0,
    kIndexOfYourRepositories,
    kNumberOfContents
};

@interface BGGlobalMenuContents()
@property (nonatomic, strong) BGEventsController *newsFeedsController;
@property (nonatomic, strong) BGRepositoriesController *yourRepositoriesController;
@end

@implementation BGGlobalMenuContents

+ (id)sharedContents {
    
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;    
}

- (NSString *)contentsTitleForIndex:(NSInteger)index {
    return ((UIViewController*)[self contentsControllerForIndex:index]).title;
}

- (id)contentsControllerForIndex:(NSInteger)index {
    switch (index) {
        case kIndexOfNewsFeeds:
            return self.newsFeedsController;
        case kIndexOfYourRepositories:
            return self.yourRepositoriesController;
    }
    return nil;
}

- (NSInteger)numberOfContents {
    return kNumberOfContents;
}

- (BGEventsController *)newsFeedsController {
    if(!_newsFeedsController) {
        _newsFeedsController = [[BGEventsController alloc] init];
        _newsFeedsController.title = @"News Feeds";
    }
    return _newsFeedsController;
}

- (BGRepositoriesController *)yourRepositoriesController {
    if(!_yourRepositoriesController) {
        _yourRepositoriesController = [[BGRepositoriesController alloc] init];
        _yourRepositoriesController.title = @"Your Repositories";
    }
    return _yourRepositoriesController;
}
@end
