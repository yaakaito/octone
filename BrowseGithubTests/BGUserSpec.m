//
//  BrowseGithub - BGUserSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGUser.h"
#import "BGAuthenticationManager.h"
#import <NLTHTTPStubServer/NLTHTTPStubServer.h>
#import "NLTHTTPStubServer+Specs.h"
#import "AsyncSupporter.h"
#import "NSBundle+Specs.h"

@interface BGGithubResource(Specs)
@property (nonatomic, strong) NSURL *resourceUrl;
@end

SPEC_BEGIN(BGUserSpec)

describe(@"Github User", ^{
    __block BGUser *user;
    __block NSString *accessToken;
    
    beforeAll(^{
        accessToken = [[BGAuthenticationManager sharedManager] accessToken];
    });
    
    context(@"を初期化するとき", ^{
        it(@"は、ユーザー名を元にアドレスを構築する", ^{
            user = [BGUser userWithUserName:@"yaakaito"];
            [[[user.resourceUrl absoluteString] should] equal:@"https://api.github.com/users/yaakaito"];
        });
        
        it(@"は、ログインユーザーの情報を取得するURLを構築する", ^{
            user = [BGUser userWithLoginUser];
            NSString *url = [NSString stringWithFormat:@"https://api.github.com/user?access_token=%@", accessToken];
            [[[user.resourceUrl absoluteString] should] equal:url];
        });
    });
    
    context(@"がAPIから受け取ったデータをパースしたとき", ^{
        __block NLTHTTPStubServer *server;
        __block AsyncSupporter *asyncSupporter;
        
        beforeAll(^{
            server = [NLTHTTPStubServer sharedSpecServer];
            
            asyncSupporter = [[AsyncSupporter alloc] init];
            [asyncSupporter prepare];
            NSData *json = [NSBundle jsonForResourceName:@"user"];
            [[[server stub] forPath:@"/user"] andJSONResponse:json];
            
            user = [[BGUser alloc] initWithUrl:[NSURL URLWithString:@"http://localhost:12345/user"]];
            [user loadDataWithComplete:^{
                [asyncSupporter notify:kAsyncSupporterWaitStatusSuccess];
            } failure:^{
                [asyncSupporter notify:kAsyncSupporterWaitStatusFailure];
            }];
            
            [asyncSupporter waitForTimeout:3];
        });
        
        /*
         {
         "type": "User",
         "gravatar_id": "8ba73f340ca40f9aa49a521fdc9512ce",
         "blog": null,
         "login": "yaakaito",
         "public_gists": 14,
         "created_at": "2010-05-21T17:42:16Z",
         "email": "yaakaito@gmail.com",
         "company": null,
         "followers": 24,
         "avatar_url": "https://secure.gravatar.com/avatar/8ba73f340ca40f9aa49a521fdc9512ce?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
         "html_url": "https://github.com/yaakaito",
         "name": "KAZUMA Ukyo",
         "hireable": false,
         "url": "https://api.github.com/users/yaakaito",
         "following": 50,
         "location": null,
         "id": 283562,
         "public_repos": 73,
         "bio": ""
         }
         */
                
        it(@"はログイン名を持つ", ^{
            [[user.login should] equal:@"yaakaito"];
        });
        
        it(@"はユーザー名を持つ", ^{
            [[user.name should] equal:@"KAZUMA Ukyo"];
        });
        
        it(@"はメールアドレスを持つ", ^{
            [[user.email should] equal:@"yaakaito@gmail.com"];
        });
        
        it(@"は、フォロワー数を持つ", ^{
            [[theValue(user.followers) should] equal:theValue(24)];
        });
        
        it(@"は、フォロー数を持つ", ^{
            [[theValue(user.following) should] equal:theValue(50)];
        });
        
        it(@"は、パブリックなリポジトリ数を持つ", ^{
            [[theValue(user.publicRepos) should] equal:theValue(73)];
        });
        
        it(@"は、gravatarのアドレスを持つ", ^{
            [[[user.gravatarUrl absoluteString] should] equal:@"https://secure.gravatar.com/avatar/8ba73f340ca40f9aa49a521fdc9512ce?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"];
        });
        
                
        afterAll(^{
            [[theValue([server isStubEmpty]) should] beYes];
            [server clear];
        });
    });

});

SPEC_END
