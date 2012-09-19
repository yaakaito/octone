//
//  BrowseGithub - BGReceivedEventsSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGReceivedEvents.h"
#import "BGUser.h"
#import "BGEvent.h"
#import "BGAuthenticationManager.h"
#import <NLTHTTPStubServer/NLTHTTPStubServer.h>
#import "NLTHTTPStubServer+Specs.h"
#import "AsyncSupporter.h"
#import "NSBundle+Specs.h"


SPEC_BEGIN(BGReceivedEventsSpec)

describe(@"Received Events", ^{
    __block BGReceivedEvents *receivedEvents;
    __block BGUser *user;
    NSString *accessToken = [[BGAuthenticationManager sharedManager] accessToken];

    beforeAll(^{
        user = [[BGUser alloc] init];
        user.login = @"yaakaito";
    });

    context(@"をUserによって初期化するとき", ^{
        beforeAll(^{
            receivedEvents = [BGReceivedEvents receivedEventsWithUser:user];
        });
        
        it(@"は、ユーザーのログイン名を元にアドレスを構築する", ^{
            NSString *url = [NSString stringWithFormat:@"https://api.github.com/users/yaakaito/received_events?access_token=%@", accessToken];
            [[[receivedEvents.resourceUrl absoluteString] should] equal:url];
        });
        
    });
    
    context(@"がAPIから受け取ったデータをパースしたとき", ^{
        __block NLTHTTPStubServer *server;
        __block AsyncSupporter *asyncSupporter;
        
        beforeAll(^{
            server = [NLTHTTPStubServer sharedSpecServer];
            
            asyncSupporter = [[AsyncSupporter alloc] init];
            [asyncSupporter prepare];
            NSData *json = [NSBundle jsonForResourceName:@"received_events"];
            [[[server stub] forPath:@"/received_events"] andJSONResponse:json];
            
            receivedEvents = [[BGReceivedEvents alloc] initWithUrl:[NSURL URLWithString:@"http://localhost:12345/received_events"]];
            [receivedEvents loadDataWithComplete:^{
                [asyncSupporter notify:kAsyncSupporterWaitStatusSuccess];
            } failure:^{
                [asyncSupporter notify:kAsyncSupporterWaitStatusFailure];
            }];
            
            [asyncSupporter waitForTimeout:3];
        });
        
        it(@"は、30件のイベントを持つ", ^{
            [[[receivedEvents should] have:30] events];
            for (id event in receivedEvents.events) {
                [event shouldNotBeNil];
                [[event should] beKindOfClass:[BGEvent class]];
            }
        });
        
        afterAll(^{
            [[theValue([server isStubEmpty]) should] beYes];
            [server clear];
        });
    });

});

SPEC_END
