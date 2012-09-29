//
//  BrowseGithub - BGGlobalMenuContentsSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGGlobalMenuContents.h"
#import "BGEventsController.h"
#import "BGRepositoriesController.h"

SPEC_BEGIN(BGGlobalMenuContentsSpec)

describe(@"Global Menu Contents ", ^{

    BGGlobalMenuContents *contents = [BGGlobalMenuContents sharedContents];
    context(@"の基本メニュー", ^{
        it(@"は2つ", ^{
            [[theValue([contents numberOfContents]) should] equal:theValue(2)];
        });
        
        context(@"のタイトル", ^{
            it(@"は、1番目は'News Feeds'", ^{
                [[[contents contentsTitleForIndex:0] should] equal:@"News Feeds"];
            });
            it(@"は、2番目は'Your Repositories'", ^{
                [[[contents contentsTitleForIndex:1] should] equal:@"Your Repositories"];
            });
        });
        
        context(@"の返すコントローラー", ^{
            it(@"は、1番目はEventsController", ^{
                [[[contents contentsControllerForIndex:0] should] beKindOfClass:[BGEventsController class]];
            });
            it(@"は、2番目はRepositoriesController", ^{
                [[[contents contentsControllerForIndex:1] should] beKindOfClass:[BGRepositoriesController class]];
            });
        });
    });
});

SPEC_END
