
//  BrowseGithub - BGFeedManagerSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
@class BGEventManager;

SPEC_BEGIN(BGEventManagerSpec)

describe(@"Event Manager", ^{
    __block BGEventManager *manager;
    context(@"ユーザーのプライベートライムラインを取得", ^{
        beforeAll(^{
            manager = [[BGEventManager alloc] init];
            [manager reloadUserPrivateTimeline];
        });
        
        it(@"取得に成功したとき、30件のイベントをリストで受け取ることができる", ^{
            [[[manager should] have:30] userPrivateTimelines];
        });
    });
    
    context(@"タイムラインの表示", ^{
    
        pending(@"表示するタイムラインのフィルター", ^{
            
        });

        pending(@"フィルターしないとすべてのタイムラインを表示", ^{
        });
    
    });
    

});

SPEC_END
