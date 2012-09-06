
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
    context(@"がユーザーのプライベートライムラインを取得したとき", ^{
        beforeAll(^{
            manager = [[BGEventManager alloc] init];
            [manager reloadUserPrivateTimeline];
        });
        
        it(@"は、30件のイベントリストを持つ", ^{
            [[[manager should] have:30] userPrivateTimelines];
        });
    });
    
    context(@"がタイムラインの表示するとき", ^{
    
        pending(@"に、フィルターを行ったとき", ^{
            
        });

        pending(@"に、フィルターをしないとき", ^{
        });
    
    });

});

SPEC_END
