//
//  BrowseGithub - BGRootControllerSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGRootController.h"
#import "BGAuthenticationController.h"
#import <JASidePanels/JASidePanelController.h>
#import "BGGithubResource.h"

@interface BGRootController()
@property (nonatomic, strong) BGAuthenticationController *authenticationController;
@property (nonatomic, strong) JASidePanelController *appRootController;
- (void)showNetworkError;
@end

SPEC_BEGIN(BGRootControllerSpec)

describe(@"Root Controller ", ^{
    __block BGRootController *controller;
    context(@"が初期されたとき", ^{

        beforeEach(^{
            controller = [[BGRootController alloc] init];
            [controller loadView];
        });
        
        xit(@"は、OAuth用のコントローラーを生成できる", ^{
            [controller.authenticationController shouldNotBeNil];
            [[controller.authenticationController should] beKindOfClass:[BGAuthenticationController class]];
        });
        
        xit(@"は、アプリケーションのコントローラーを生成できる", ^{
            [controller.appRootController shouldNotBeNil];
            [[controller.appRootController should] beKindOfClass:[JASidePanelController class]];
        });
        
        
        context(@"にOAuthが行われていないとき", ^{
            xit(@"は、OAuth用のコントローラーを起動する", ^{
                
            });
            
            xit(@"は、OAuthに成功したことを受け取ったら、アプリケーションのコントローラーに切り替える", ^{
                
            });
        });
        
        context(@"にOAuthが行われているとき", ^{
            xit(@"は、アプリケーションのコントローラーを起動する", ^{
                
            });
        });

    });

    
    context(@"がエラー通知を受け取ったとき", ^{
        
        beforeAll(^{
            controller = [[BGRootController alloc] init];
            [controller loadView];
            [controller viewDidLoad];
            [controller viewWillAppear:NO];
            [controller viewDidAppear:NO];
        });
        
        it(@"は、ネットワークのエラーなら、ネットワーク1エラーを表示する", ^{
            [[controller should] receive:@selector(showNetworkError)];
            [[NSNotificationCenter defaultCenter] postNotificationName:kBGGithubResourceRequestFailureNotification];
        });
        
        xit(@"は、APIのエラーなら、APIエラーを表示する", ^{
            ;
        });
        
        xit(@"は、OAuth関連のエラーなら、OAuthエラーを表示し、OAuth画面を表示する", ^{
            ;
        });
    });

});

SPEC_END
