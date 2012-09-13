
//  BrowseGithub - BGFeedManagerSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGEventManager.h"

@interface BGEventManager()
@property (nonatomic, strong) NSArray *currentEvents;
@end

SPEC_BEGIN(BGEventManagerSpec)

describe(@"Event Manager", ^{
    __block BGEventManager *manager;
    
    context(@"がログインユーザーが受け取ったイベントを取得するとき", ^{
       
        it(@"は、取得に成功したとき、コールバックをsuccess=YESで呼び出す", ^{
            __block BOOL called;
            [manager reloadLoginUserReceivedEvents:^(BOOL success){
                [[theValue(success) should] beYes];
                called = YES;
            }];
            [[theValue(called) should] beYes];
        });
        
        it(@"は、取得に失敗したとき、コールバックをsuccess=NOで呼び出す", ^{
            __block BOOL called;
            [manager reloadLoginUserReceivedEvents:^(BOOL success){
                [[theValue(success) should] beNo];
                called = YES;
            }];
            [[theValue(called) should] beYes];
        });
    });

    context(@"に、表示用のデータを要求したとき", ^{
        __block NSArray *events;
        beforeEach(^{
            events = @[@"hoge", @"hoge", @"hoge"];
        });
        
        it(@"は、イベントの件数を返す", ^{
            [[theValue([manager numberOfEvents]) should] equal:theValue(3)];
        });
        
        it(@"は、対象のインデックスのイベントオブジェクトを返す", ^{
            for (NSUInteger i = 0; i < 3; i++) {
                [manager eventFor]
            }
        });
    });

});

SPEC_END
