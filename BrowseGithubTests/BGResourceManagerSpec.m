//
//  BrowseGithub - BGResourceManagerSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGResourceManager.h"
#import "MockResource.h"

SPEC_BEGIN(BGResourceManagerSpec)

describe(@"Resource Manager", ^{

    __block BGResourceManager *manager;
    __block MockResource *resource;
    
    beforeEach(^{
        manager = [[BGResourceManager alloc] init];
        resource = [[MockResource alloc] init];
    });
    
    context(@"がリソースをリロードしたとき", ^{
        
        it(@"は、成功すればcompleteブロックが呼び出され、setResourcesをリクエスト済みのリソースを使って呼び出す", ^{
            __block BOOL calledComplate = NO;
            resource.success = YES;
            [[manager should] receive:@selector(setResourcesFromResource:reload:) withCount:1 arguments:any(), theValue(YES)];
            [manager reloadResource:resource
                           complete:^{
                               calledComplate = YES;
                           } failure:^{
                               calledComplate = NO;
                           }];
            [[theValue(calledComplate) should] beYes];
            
        });
        
        it(@"は、なんらかの理由で失敗すれば、failureブロックを呼び出す", ^{
            __block BOOL calledFailure = NO;
            resource.success = NO;
            [[manager should] receive:@selector(setResourcesFromResource:reload:) withCount:0];
            [manager reloadResource:resource
                           complete:^{
                               calledFailure = NO;
                           } failure:^{
                               calledFailure = YES;
                           }];
            [[theValue(calledFailure) should] beYes];
        });
    });
    
    context(@"がリソースを追加したとき", ^{
        it(@"は、成功すればcompleteブロックが呼び出され、setResourcesをリクエスト済みのリソースを使って呼び出す", ^{
            __block BOOL calledComplate = NO;
            resource.success = YES;
            [[manager should] receive:@selector(setResourcesFromResource:reload:) withCount:1 arguments:any(), theValue(NO)];
            [manager addResource:resource
                        complete:^{
                            calledComplate = YES;
                        } failure:^{
                            calledComplate = NO;
                        }];
            [[theValue(calledComplate) should] beYes];
        });
        
        it(@"は、なんらかの理由で失敗すれば、failureブロックを呼び出す", ^{
            __block BOOL calledFailure = NO;
            resource.success = NO;
            [[manager should] receive:@selector(setResourcesFromResource:reload:) withCount:0];
            [manager addResource:resource
                        complete:^{
                            calledFailure = NO;
                        } failure:^{
                            calledFailure = YES;
                        }];
            [[theValue(calledFailure) should] beYes];
        });
    });
    
});

SPEC_END
