//
//  BrowseGithub - BGUserSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGUser.h"
#import "BGAuthenticationManager.h"

SPEC_BEGIN(BGUserSpec)

describe(@"Github User", ^{
    __block BGUser *user;
    __block NSString *accessToken;
    
    beforeAll(^{
        accessToken = [[BGAuthenticationManager sharedManager] accessToken];
    });
    
    context(@"を初期化するとき", ^{
        it(@"は、ユーザー名を元にアドレスを構築する", ^{
            user = [[BGUser alloc] initWithUserName:@"yaakaito"];
            [[[user.resourceUrl absoluteString] should] equal:@"https://api.github.com/users/yaakaito"];
        });
        
        it(@"は、ログインユーザーの情報を取得するURLを構築する", ^{
            user = [[BGUser alloc] initWithLoginUser];
            NSString *url = [NSString stringWithFormat:@"https://api.github.com/user?access_token=%@", accessToken];
            [[[user.resourceUrl absoluteString] should] equal:url];
        });
    });
});

SPEC_END
