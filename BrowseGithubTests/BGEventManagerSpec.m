
//  BrowseGithub - BGFeedManagerSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGEvent.h"
#import "BGEventManager.h"
#import "BGGithubResource.h"
#import "MockReceivedEvents.h"

@interface BGEventManager()
@property (nonatomic, strong) NSArray *currentEvents;
@property (nonatomic, strong) BGGithubResource *currentResource;
@end

SPEC_BEGIN(BGEventManagerSpec)

describe(@"Event Manager", ^{

    BGEventManager *manager = [[BGEventManager alloc] init];
    
    context(@"がprepareせずにreloadしたとき", ^{
        it(@"は、コールバックをsuccess=NOで呼び出す", ^{
            __block BOOL called;
            [manager reloadCurrentResource:^(BOOL success){
                [[theValue(success) should] beNo];
                called = YES;
            }];
            [[theValue(called) should] beYes];
        });
    });
    
    context(@"がなんらかのイベントを取得するとき", ^{
        __block MockReceivedEvents *mock;
        beforeAll(^{
            mock = [[MockReceivedEvents alloc] initWithSuccess:YES];
            
            [manager prepareLoginUserReceivedEvents];
            manager.currentResource = mock;
        });
       
        it(@"は、取得に成功したとき、コールバックをsuccess=YESで呼び出す", ^{
            mock.success = YES;
            __block BOOL called;
            [manager reloadCurrentResource:^(BOOL success){
                [[theValue(success) should] beYes];
                called = YES;
            }];
            [[theValue(called) should] beYes];
        });
        
        it(@"は、取得に失敗したとき、コールバックをsuccess=NOで呼び出す", ^{
            mock.success = NO;
            __block BOOL called;
            [manager reloadCurrentResource:^(BOOL success){
                [[theValue(success) should] beNo];
                called = YES;
            }];
            [[theValue(called) should] beYes];
        });
    });
    
    context(@"がログインユーザーが受け取ったイベントを取得するとき", ^{
       
        xit(@"は、ログインユーザー用のリソースを利用する", ^{
            [manager prepareLoginUserReceivedEvents];
            
        });
    });

    context(@"に、表示用のデータを要求したとき", ^{
        __block NSArray *events;
        beforeEach(^{
            events = @[@"hoge", @"hoge", @"hoge"];
        });
        
        xit(@"は、イベントの件数を返す", ^{
            [[theValue([manager numberOfEvents]) should] equal:theValue(3)];
        });
        
        xit(@"は、対象のインデックスのイベントオブジェクトを返す", ^{
            for (NSUInteger i = 0; i < 3; i++) {
                BGEvent *actual = [manager eventAtIndex:i];
                BGEvent *expected = [events objectAtIndex:i];
                [[actual.typeString should] equal:expected.typeString];
            }
        });
    });

});

SPEC_END
