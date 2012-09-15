//
//  BrowseGithub - BGRootControllerSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGRootController.h"

SPEC_BEGIN(BGRootControllerSpec)

describe(@"Root Controller ", ^{
    __block BGRootController *controller;
    context(@"が初期されたとき", ^{

        xit(@"は、エラー通知用のnotificationを受け取れる", ^{
            ;
        });
        
        xit(@"は、OAuth用のコントローラーを生成できる", ^{
            
        });
        
        xit(@"は、アプリケーションのコントローラーを生成できる", ^{
            
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
        
        xit(@"は、ネットワークのエラーなら、connectionエラーを表示する", ^{
            
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
