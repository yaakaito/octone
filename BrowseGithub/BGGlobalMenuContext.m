//
//  BGGlobalMenuContents.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGGlobalMenuContext.h"
#import "BGEventsController.h"
#import "BGRepositoriesController.h"
#import "BGIssuesController.h"
#import "BGPullRequestsController.h"
#import "BGStarsController.h"

enum Contents {
    kIndexOfNewsFeeds = 0,
    kIndexOfYourRepositories,
    kIndexOfIssues,
    kIndexOfPullRequests,
    kIndexOfStarts,
    kNumberOfContents
};

@interface BGGlobalMenuContext()
@property (nonatomic, strong) BGEventsController *newsFeedsController;
@property (nonatomic, strong) BGRepositoriesController *yourRepositoriesController;
@property (nonatomic, strong) BGIssuesController *issuesController;
@property (nonatomic, strong) BGPullRequestsController *pullRequestsController;
@property (nonatomic, strong) BGStarsController *starsController;
@end

@implementation BGGlobalMenuContext

+ (id)sharedContents {
    
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;    
}



- (BGMenuContents *)contentsForIndex:(NSInteger)index {
    BGMenuContents *contents = [[BGMenuContents alloc] init];
    contents.icon = [UIImage imageNamed:@"feed"];
    contents.title = ((UIViewController*)[self contentsControllerForIndex:index]).title;
    
    return contents;
}

- (id)contentsControllerForIndex:(NSInteger)index {
    switch (index) {
        case kIndexOfNewsFeeds:
            return self.newsFeedsController;
        case kIndexOfYourRepositories:
            return self.yourRepositoriesController;
        case kIndexOfIssues:
            return self.issuesController;
        case kIndexOfPullRequests:
            return self.pullRequestsController;
        case kIndexOfStarts:
            return self.starsController;
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

- (BGIssuesController *)issuesController {
    if(!_issuesController) {
        _issuesController = [[BGIssuesController alloc] init];
        _issuesController.title = @"Issues";
    }
    return _issuesController;
}

- (BGPullRequestsController *)pullRequestsController {
    if(!_pullRequestsController) {
        _pullRequestsController = [[BGPullRequestsController alloc] init];
        _pullRequestsController.title = @"Pull Requests";
    }
    return _pullRequestsController;
}

- (BGStarsController *)starsController {
    if(!_starsController) {
        _starsController = [[BGStarsController alloc] init];
        _starsController.title = @"Stars";
    }
    return _starsController;
}
@end
