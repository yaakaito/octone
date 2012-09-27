//
//  BrowseGithub - BGUserSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGUser.h"
#import "BGAuthenticationManager.h"
#import "NSBundle+Specs.h"

@interface BGGithubResource(Specs)
@property (nonatomic, strong) NSURL *resourceUrl;
@end

SPEC_BEGIN(BGUserSpec)

describe(@"Github User", ^{
    __block BGUser *user;
    
    context(@"を初期化するとき", ^{
        it(@"は、ユーザー名を元にアドレスを構築する", ^{
            user = [BGUser userWithUserName:@"yaakaito"];
            [[[user.resourceUrl absoluteString] should] equal:@"https://api.github.com/users/yaakaito"];
        });
        
        it(@"は、ログインユーザーの情報を取得するURLを構築する", ^{
            [[[BGAuthenticationManager sharedManager] should] receive:@selector(accessToken) andReturn:@"ACCESS_TOKEN"];
            user = [BGUser userWithLoginUser];
            [[[user.resourceUrl absoluteString] should] equal:@"https://api.github.com/user?access_token=ACCESS_TOKEN"];
        });
    });
    
    context(@"がuser.jsonをパースしたとき", ^{
        
        beforeAll(^{
            id json = [NSBundle jsonObjectForResourceName:@"user"];
            user = [[BGUser alloc] init];
            [user setValuesFromJSON:json];
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
        
    });

});

SPEC_END
