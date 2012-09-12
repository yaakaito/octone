//
//  BrowseGithub - BGListControllerSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGListController.h"
#import "BGTableView.h"
#import <SVPullToRefresh/SVPullToRefresh.h>

SPEC_BEGIN(BGListControllerSpec)

describe(@"List Controller", ^{
    __block BGListController *controller;

    context(@"が、作られたとき", ^{
        beforeEach(^{
            controller = [[BGListController alloc] init];
            [controller loadView];
        });
        
        it(@"の、ビューはBGTableView", ^{
            [[controller.view should] beKindOfClass:[BGTableView class]];
        });
        
        xit(@"は、viewDidLoad後にreloadDataを呼び出す", ^{
            [[controller should] receive:@selector(reloadData:) withCount:1];
            [controller viewDidLoad];
        });
    });
    
    context(@"に、ユーザーがリフレッシュを要求したとき", ^{
        
        beforeEach(^{
            controller = [[BGListController alloc] init];
            [controller loadView];
            [controller viewDidLoad];
            [controller viewWillAppear:NO];
            [controller viewDidAppear:NO];
        });
        
        xit(@"は、reloadDataを呼び出す", ^{
            [[controller should] receive:@selector(reloadData:) withCount:1];
            [((BGTableView*)controller.view).pullToRefreshView triggerRefresh];
        });
    });
});

SPEC_END
