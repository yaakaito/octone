
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
@property (nonatomic, strong) NSMutableArray *events;
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
    
    
    context(@"がreceived_events.jsonを取得したとき", ^{
        __block MockReceivedEvents *mock;
        beforeAll(^{
            manager = [[BGEventManager alloc] init];
            mock = [[MockReceivedEvents alloc] init];
            mock.success = YES;
            __block BOOL calledComplete;
            [manager reloadResource:mock
                           complete:^{
                               calledComplete = YES;
                           } failure:^{
                               calledComplete = NO;
                           }];
            
            [[theValue(calledComplete) should] beYes];
        });
       
        it(@"は、JSONをパースし、30件のEntryを取り出せる", ^{
            [[[manager should] have:30] events];
            for (id event in manager.events) {
                [[event should] beKindOfClass:[BGEvent class]];
            }
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
            manager.events = [events mutableCopy];
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
