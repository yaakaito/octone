//
//  BrowseGithub - BGAuthenticationManagerSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGAuthenticationManager.h"
#import "BGSecretKeys.h"
#import "UIApplication+Spec.h"

SPEC_BEGIN(BGAuthenticationManagerSpec)

describe(@"Authentication Manager", ^{
    __block BGAuthenticationManager *manager;
    context(@"がOAuthしていないとき", ^{
        beforeEach(^{
            manager = [[BGAuthenticationManager alloc] init];
        });
        
        xit(@"は、認証されていないと返す", ^{
            [[theValue([manager authenticated]) should] beNo];
        });
        
        xit(@"は、トークンを持っていない", ^{
            [[manager accessToken] shouldBeNil];
        });
    });
    
    context(@"がOAuthを開始したとき", ^{
        context(@"OAuthを開始したとき", ^{
            beforeAll(^{
                // ヘルパーでUIApplicationをモック
                [[UIApplication sharedApplication] swapOpenURL];
            });
            
            beforeEach(^{
                manager = [[BGAuthenticationManager alloc] init];
            });
            
            xit(@"SafariへClient_IDとstateを持ってリダイレクトされる", ^{
                [manager startGithubOAuth];
                NSURL *openedURL = [[UIApplication sharedApplication] openedURL];
                [openedURL shouldNotBeNil];
                //NSString *githubURL = [NSString stringWithFormat:@"https://github.com/login/oauth/authorize?client_id=%@&scope=%@&state=%@"]
                //[[[openedURL absoluteString] should] equal:githubURL];
            });
            
            xit(@"timeoutIntervalを超える時間があくと、OAuthは強制的に失敗する", ^{
                ;
            });
            
            afterAll(^{
                // ヘルパーを元に戻す
                [[UIApplication sharedApplication] swapOpenURL];
            });
        });
    });
    
    context(@"が認証を完了したあと", ^{
        beforeEach(^{
            manager = [[BGAuthenticationManager alloc] init];
            // なんらかの手順で認証を通す
        });
        
        xit(@"は、認証されていると返す", ^{
            [[theValue([manager authenticated]) should] beYes];
        });
        
        it(@"は、何らかのアクセストークンを持っている", ^{
            [[[manager accessToken] should] equal:kDebugAccessKey];
        });
        
        it(@"は、ログインユーザーの情報を取得できる", ^{
            [[manager loginUser] shouldNotBeNil];
            BGUser *user = [manager loginUser];
            [[user.login should] equal:@"yaakaito"];
        });
    });
});

SPEC_END
 
