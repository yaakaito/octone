//
//  BrowseGithub - BGAuthenticationManagerSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGAuthenticationManager.h"

SPEC_BEGIN(BGAuthenticationManagerSpec)

describe(@"Authentication Manager", ^{
    __block BGAuthenticationManager *manager;
    context(@"OAuthしていない状態noとき", ^{
        beforeEach(^{
            manager = [[BGAuthenticationManager alloc] init];
        });
        
        it(@"authenticatedはNO", ^{
            [[theValue([manager authenticated]) should] beYes];
        });
        
        it(@"tokenは取得できない", ^{
            [[manager accessToken] shouldBeNil];
        });
    });
    
    pending(@"Authentication", ^{
        context(@"OAuthを開始したとき", ^{
            beforeAll(^{
                // ヘルパーでUIApplicationをモック
            });
            
            beforeEach(^{
                manager = [[BGAuthenticationManager alloc] init];
            });
            
            pending(@"SafariへClient_IDとstateを持ってリダイレクトされる", ^{
                ;
            });
            
            pending(@"timeoutIntervalを超える時間があくと、OAuthは強制的に失敗する", ^{
                ;
            });
            
            afterAll(^{
                // ヘルパーを元に戻す
            });
        });
    });
});

SPEC_END
