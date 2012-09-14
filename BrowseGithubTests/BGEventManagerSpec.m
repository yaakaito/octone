
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
#import "BGAuthenticationManager.h"

@interface BGEventManager()
@property (nonatomic, strong) NSArray *currentEvents;
@property (nonatomic, strong) BGGithubResource *currentResource;
@end

@interface BGEvent()
@property (nonatomic, strong) NSString *typeString;
@property (nonatomic, strong) id payload;
@property (nonatomic, strong) NSString *actorLogin;
@property (nonatomic, strong) NSURL *actorGravatarUrl;
@property (nonatomic, strong) NSString *repositoryName;
@end

SPEC_BEGIN(BGEventManagerSpec)

describe(@"Event Manager", ^{

    __block BGEventManager *manager;
    
    context(@"がprepareせずにreloadしたとき", ^{
        beforeAll(^{
            manager = [[BGEventManager alloc] init];
        });
        
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
            manager = [[BGEventManager alloc] init];
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
        
        it(@"は、モックの取得に成功したとき、received_events.jsonをパースする", ^{
            mock.success = YES;
            __block BOOL called;
            [manager reloadCurrentResource:^(BOOL success){
                [[theValue(success) should] beYes];
                called = YES;
            }];
            [[theValue(called) should] beYes];
            [[[manager should] have:30] currentEvents];
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
       
        it(@"は、ログインユーザー用のリソースを利用する", ^{
            manager = [[BGEventManager alloc] init];
            [manager prepareLoginUserReceivedEvents];
            BGReceivedEvents *receivedEvents = (BGReceivedEvents*)manager.currentResource;
            [[receivedEvents should] beKindOfClass:[BGReceivedEvents class]];
            NSString *url = [NSString stringWithFormat:@"https://api.github.com/users/yaakaito/received_events?access_token=%@", [[BGAuthenticationManager sharedManager] accessToken]];
            [[[receivedEvents.resourceUrl absoluteString] should] equal:url];
        });
    });
    
    

    context(@"に、表示用のデータを要求したとき", ^{
        
        BGEvent*(^createEvent)(NSString*, NSString*, NSString*, NSString*) = ^(NSString* type, NSString* action, NSString* actorLogin, NSString* repositoryName) {
            BGEvent *event = [[BGEvent alloc] initWithJSON:nil];
            event.typeString = type;
            event.payload = @{ @"action" : action};
            event.actorLogin = actorLogin;
            event.repositoryName = repositoryName;
            
            return event;
        };
        
        __block NSArray *events;
        beforeEach(^{
            manager = [[BGEventManager alloc] init];

            events = @[createEvent(@"hoge", @"hoge", @"hoge", @"hoge/hoge"),
                       createEvent(@"fuga", @"fuga", @"fuga", @"fuga/fuga"),
                       createEvent(@"piyo", @"piyo", @"piyo", @"piyo/piyo")];
            manager.currentEvents = events;
        });
        
        it(@"は、イベントの件数を返す", ^{
            [[theValue([manager numberOfEvents]) should] equal:theValue(3)];
        });
        
        it(@"は、対象のインデックスのイベントオブジェクトを返す", ^{
            for (NSUInteger i = 0; i < 3; i++) {
                BGEvent *actual = [manager eventAtIndex:i];
                BGEvent *expected = [events objectAtIndex:i];
                [[actual.typeString should] equal:expected.typeString];
            }
        });
    });

});

SPEC_END
