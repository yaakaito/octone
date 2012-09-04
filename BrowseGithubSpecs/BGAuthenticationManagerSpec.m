//
//  BrowseGithub - BGAuthenticationManagerSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGAuthenticationManager.h"
#import "BGSecretKeys.h"

SPEC_BEGIN(BGAuthenticationManagerSpec)

describe(@"Authentication Manager", ^{
    __block BGAuthenticationManager *manager;
    context(@"OAuthしていない状態noとき", ^{
        beforeEach(^{
            manager = [[BGAuthenticationManager alloc] init];
        });
        
        it(@"authenticatedはNO", ^{
            [[theValue([manager authenticated]) should] beNo];
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
    
    context(@"認証が完了したあと", ^{
        beforeEach(^{
            manager = [[BGAuthenticationManager alloc] init];
            // なんらかの手順で認証を通す
        });
        
        it(@"authenticatedはYES", ^{
            [[theValue([manager authenticated]) should] beYes];
        });
        
        it(@"デバッグ用のトークンが取得できる", ^{
            [[[manager accessToken] should] equal:kDebugAccessKey];
        });
    });
});

SPEC_END
