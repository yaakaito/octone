//
//  BrowseGithub - BGRepositoriesSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGRepositories.h"
#import "BGRepository.h"
#import "BGUser.h"
#import "BGAuthenticationManager.h"
#import "NSBundle+Specs.h"

SPEC_BEGIN(BGRepositoriesSpec)

describe(@"Repositories", ^{
    __block BGRepositories *repositories;

    NSString *accessToken = [[BGAuthenticationManager sharedManager] accessToken];

    context(@"をログインユーザーを対象に初期化するとき", ^{

        it(@"は、ログインユーザーを元にリポジトリのアドレスを構築する", ^{
            repositories = [BGRepositories repositoriesWithLoginUserPerPage:10 forPage:1];
            NSString *url = [NSString stringWithFormat:@"https://api.github.com/user/repos?per_page=10&page=1&sort=pushed&access_token=%@", accessToken];
            [[[repositories.resourceUrl absoluteString] should] equal:url];
        });
    });
    
    context(@"をUserによって初期化するとき", ^{
        it(@"は、ユーザー情報を元にパブリックリポジトリのアドレスを構築する", ^{
            BGUser *user = [[BGUser alloc] init];
            user.login = @"yaakaito";
            repositories = [BGRepositories repositoriesWithUser:user perPage:20 forPage:2];
            NSString *url = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos?per_page=20&page=2&sort=pushed", user.login];
            [[[repositories.resourceUrl absoluteString] should] equal:url];
        });
    });

    context(@"がuser.repos.jsonをパースしたとき", ^{
        
        beforeAll(^{
            id json = [NSBundle jsonObjectForResourceName:@"user.repos"];
            repositories = [[BGRepositories alloc] init];
            [repositories setValuesFromJSON:json];
        });

        it(@"は、10件のリポジトリを持つ", ^{
            [[[repositories should] have:10] repositories];
            for (id repository in repositories.repositories) {
                [repository shouldNotBeNil];
                [[repository should] beKindOfClass:[BGRepository class]];
                [((BGRepository*)repository).name shouldNotBeNil];
            }
        });
        
    });
});


SPEC_END
