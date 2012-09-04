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
    context(@"がOAuthしていないとき", ^{
        beforeEach(^{
            manager = [[BGAuthenticationManager alloc] init];
        });
        
        it(@"は、認証されていないと返す", ^{
            [[theValue([manager authenticated]) should] beNo];
        });
        
        it(@"は、トークンを持っていない", ^{
            [[manager accessToken] shouldBeNil];
        });
    });
    
    pending(@"がOAuthを開始したとき", ^{
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
    
    context(@"が認証を完了したあと", ^{
        beforeEach(^{
            manager = [[BGAuthenticationManager alloc] init];
            // なんらかの手順で認証を通す
        });
        
        it(@"は、認証されていると返す", ^{
            [[theValue([manager authenticated]) should] beYes];
        });
        
        it(@"は、何らかのアクセストークンを持っている", ^{
            [[[manager accessToken] should] equal:kDebugAccessKey];
        });
    });
});

SPEC_END
