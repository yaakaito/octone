//
//  BrowseGithub - BGGithubResourceSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGGithubResource.h"

SPEC_BEGIN(BGGithubResourceSpec)

describe(@"Github Resource", ^{
    __block BGGithubResource *githubResorce;
    
    context(@"を初期化するとき", ^{
        
        it(@"は、APIパスを引数に受け取り、URLを構築する", ^{
            githubResorce = [[BGGithubResource alloc] initWithPath:@"/user"];
            NSURL *url = githubResorce.resourceUrl;
            [[[url absoluteString] should] equal:@"http://api.github.com/user"];
        });
        
        it(@"は、クエリ付きのAPIパスを引数に受け取り、URLを構築する", ^{
            githubResorce = [[BGGithubResource alloc] initWithPath:@"/user?page=1"];
            NSURL *url = githubResorce.resourceUrl;
            [[[url absoluteString] should] equal:@"http://api.github.com/user"];
        });
        
        it(@"は、APIパスを引数に受け取り、認可情報を付加したURLを構築する", ^{
            githubResorce = [[BGGithubResource alloc] initWithAuthAndPath:@"/user"];
            NSURL *url = githubResorce.resourceUrl;
            NSString *urlString = [NSString stringWithFormat:@"http://api.github.com/user?access_token=%@", kDebugAccessToken];
            [[[url absoluteString] should] equal:urlString];
        });
        
        it(@"は、クエリ付きのAPIパスを引数に受け取り、認可情報を付加したURLを構築する", ^{
            githubResorce = [[BGGithubResource alloc] initWithAuthAndPath:@"/user?page=1"];
            NSURL *url = githubResorce.resourceUrl;
            NSString *urlString = [NSString stringWithFormat:@"http://api.github.com/user?page=1&access_token=%@", kDebugAccessToken];
        });
    });
});

SPEC_END
