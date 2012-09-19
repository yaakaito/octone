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
#import <NLTHTTPStubServer/NLTHTTPStubServer.h>
#import "NLTHTTPStubServer+Specs.h"
#import "AsyncSupporter.h"
#import "NSBundle+Specs.h"

@interface BGGithubResource(Specs)
@property (nonatomic, strong) NSURL *resourceUrl;
@end

SPEC_BEGIN(BGRepositoriesSpec)


// initWithPathで全部やって、
// ゲッターでLoginUserとかやったほうが綺麗じゃね？
describe(@"Repositories", ^{
    __block BGRepositories *repositories;

    NSString *accessToken = [[BGAuthenticationManager sharedManager] accessToken];

    context(@"をログインユーザーを対象に初期化するとき", ^{
        // per page
        it(@"は、ログインユーザーを元にリポジトリのアドレスを構築する", ^{
            repositories = [[BGRepositories alloc] initWithLoginUser];
            NSString *url = [NSString stringWithFormat:@"https://api.github.com/user/repos?per_page=10&page=1&sort=pushed&access_token=%@", accessToken];
            [[[repositories.resourceUrl absoluteString] should] equal:url];
            [[theValue(repositories.page) should] equal:theValue(1)];
        });
    });
    
    context(@"をUserによって初期化するとき", ^{
        it(@"は、ユーザー情報を元にパブリックリポジトリのアドレスを構築する", ^{
            BGUser *user = [[BGUser alloc] initWithLoginUser];
            user.login = @"yaakaito";
            repositories = [[BGRepositories alloc] initWithUser:user];
            NSString *url = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos?per_page=10&page=1&sort=pushed", user.login];
            [[[repositories.resourceUrl absoluteString] should] equal:url];
            [[theValue(repositories.page) should] equal:theValue(1)];
        });
    });
    
    context(@"に次のページを要求したとき", ^{
        __block BGUser *user;
        beforeEach(^{
            user = [[BGUser alloc] initWithLoginUser];
            user.login = @"yaakaito";
            user.publicRepos = 32;
        });
        
        void(^checkUrl)(NSURL*, NSInteger) = ^(NSURL *url, NSInteger page) {
            
            NSString *expected = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos?per_page=10&page=%d&sort=pushed", user.login, page];
            [[[url absoluteString] should] equal:expected];
        };
        
        it(@"は、pageを1つ増やす", ^{
            repositories = [[BGRepositories alloc] initWithUser:user];
        
            [[theValue([repositories nextPage]) should] beYes];
            checkUrl(repositories.resourceUrl, 2);
            [[theValue(repositories.page) should] equal:theValue(2)];
            
            [[theValue([repositories nextPage]) should] beYes];
            checkUrl(repositories.resourceUrl, 3);
            [[theValue(repositories.page) should] equal:theValue(3)];
            
            [[theValue([repositories nextPage]) should] beYes];
            checkUrl(repositories.resourceUrl, 4);
            [[theValue(repositories.page) should] equal:theValue(4)];
        });
        
        it(@"は、最大数を超えるページは要求できない", ^{
            repositories = [[BGRepository alloc] initWithUser:user];
            [repositories nextPage]; // 11 ~ 20
            [repositories nextPage]; // 21 ~ 30
            [repositories nextPage]; // 31 ~ 40(32)
            [[theValue([repositories nextPage]) should] beNo]; // 41 ~ 50
            [[theValue(repositories.page) should] equal:theValue(4)];
        });
    });

    
    context(@"がAPIから受け取ったデータをパースしたとき", ^{
        __block NLTHTTPStubServer *server;
        __block AsyncSupporter *asyncSupporter;
        
        beforeAll(^{
            server = [NLTHTTPStubServer sharedSpecServer];
            
            asyncSupporter = [[AsyncSupporter alloc] init];
            [asyncSupporter prepare];
            NSData *json = [NSBundle jsonForResourceName:@"user.repos"];
            [[[server stub] forPath:@"/user/repos"] andJSONResponse:json];
            
            repositories = [[BGRepositories alloc] initWithLoginUser];
            repositories.resourceUrl = [NSURL URLWithString:@"http://localhost:12345/user/repos"];
            [repositories loadDataWithComplete:^{
                [asyncSupporter notify:kAsyncSupporterWaitStatusSuccess];
            } failure:^{
                [asyncSupporter notify:kAsyncSupporterWaitStatusFailure];
            }];
            
            [asyncSupporter waitForTimeout:3];
        });

        it(@"は、10件のリポジトリを持つ", ^{
            [[[repositories should] have:10] repositories];
            for (id repository in repositories.repositories) {
                [repository shouldNotBeNil];
                [[repository should] beKindOfClass:[BGRepository class]];
            }
        });
        
        afterAll(^{
            [[theValue([server isStubEmpty]) should] beYes];
            [server clear];
        });
    });
});


SPEC_END
