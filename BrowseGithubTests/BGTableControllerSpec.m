//
//  BrowseGithub - BGListControllerSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGTableController.h"
#import "BGTableView.h"

@interface BGTableController()
- (void)refreshControlValueChanged:(UIRefreshControl*)sender;
@end

SPEC_BEGIN(BGTableControllerSpec)

describe(@"Table Controller", ^{
    __block BGTableController *controller;

    context(@"が、作られたとき", ^{
        beforeEach(^{
            controller = [[BGTableController alloc] init];
            [controller loadView];
        });
        
        it(@"の、ビューはBGTableView", ^{
            [[controller.view should] beKindOfClass:[BGTableView class]];
        });
        
        it(@"は、viewDidLoad後にreloadDataを呼び出す", ^{
            [[controller should] receive:@selector(reloadData:) withCount:1];
            [controller viewDidLoad];
        });
    
        it(@"は、refreshControlがセットされている", ^{
            [controller viewDidLoad];
            [controller.refreshControl shouldNotBeNil];
        });
    });
    
    context(@"に、ユーザーがリフレッシュを要求したとき", ^{
        
        beforeEach(^{
            controller = [[BGTableController alloc] init];
            [controller loadView];
            [controller viewDidLoad];
            [controller viewWillAppear:NO];
            [controller viewDidAppear:NO];
        });
        
        it(@"は、reloadDataを呼び出す", ^{
            [[controller should] receive:@selector(reloadData:) withCount:1];
            UIRefreshControl *refreshControl = controller.refreshControl;
            [refreshControl beginRefreshing];
            [controller refreshControlValueChanged:refreshControl];
        });
    });
});

SPEC_END
