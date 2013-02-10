//
//  BrowseGithub - BGGlobalMenuContentsSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGGlobalMenuContext.h"
#import "BGEventsController.h"
#import "BGRepositoriesController.h"
#import "BGIssuesController.h"
#import "BGPullRequestsController.h"
#import "BGStarsController.h"

SPEC_BEGIN(BGGlobalMenuContentsSpec)

describe(@"Global Menu Contents ", ^{

    BGGlobalMenuContext *contents = [BGGlobalMenuContext sharedContents];
    context(@"の基本メニュー", ^{
        it(@"は5つ", ^{
            [[theValue([contents numberOfContents]) should] equal:theValue(5)];
        });
        
        context(@"のタイトル", ^{
            it(@"は、1番目は'News Feeds'", ^{
                [[[contents contentsTitleForIndex:0] should] equal:@"News Feeds"];
            });
            it(@"は、2番目は'Your Repositories'", ^{
                [[[contents contentsTitleForIndex:1] should] equal:@"Your Repositories"];
            });
            it(@"は、3番目は'Issues'", ^{
                [[[contents contentsTitleForIndex:2] should] equal:@"Issues"];
            });
            it(@"は、4番目は'Pull Requests'", ^{
                [[[contents contentsTitleForIndex:3] should] equal:@"Pull Requests"];
            });
            it(@"は、5番目は'Stars'", ^{
                [[[contents contentsTitleForIndex:4] should] equal:@"Stars"];
            });
        });
        
        context(@"の返すコントローラー", ^{
            it(@"は、1番目はEventsController", ^{
                [[[contents contentsControllerForIndex:0] should] beKindOfClass:[BGEventsController class]];
            });
            it(@"は、2番目はRepositoriesController", ^{
                [[[contents contentsControllerForIndex:1] should] beKindOfClass:[BGRepositoriesController class]];
            });
            it(@"は、3番目はIssuesController", ^{
                [[[contents contentsControllerForIndex:2] should] beKindOfClass:[BGIssuesController class]];
            });
            it(@"は、4番目はPullRequestsController", ^{
                [[[contents contentsControllerForIndex:3] should] beKindOfClass:[BGPullRequestsController class]];
            });
            it(@"は、5番目はStarsController", ^{
                [[[contents contentsControllerForIndex:4] should] beKindOfClass:[BGStarsController class]];
            });
        });
    });
});

SPEC_END
