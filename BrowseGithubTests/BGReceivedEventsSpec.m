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
    
    context(@"がreceived_events.jsonパースしたとき", ^{
        
        beforeAll(^{
            receivedEvents = [[BGReceivedEvents alloc] init];
            id json = [NSBundle jsonObjectForResourceName:@"received_events"];
            [receivedEvents setValuesFromJSON:json];
        });
        
        it(@"は、30件のイベントを持つ", ^{
            [[[receivedEvents should] have:30] events];
            for (id event in receivedEvents.events) {
                [event shouldNotBeNil];
                [[event should] beKindOfClass:[BGEvent class]];
            }
        });
    });

});

SPEC_END
