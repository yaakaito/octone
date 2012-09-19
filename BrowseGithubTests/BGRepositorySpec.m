//
//  BrowseGithub - BGRepositorySpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGRepository.h"
#import "NSBundle+Specs.h"

SPEC_BEGIN(BGRepositorySpec)

describe(@"Repository", ^{
    __block BGRepository *repository;
    
    context(@"をJSONから初期化したとき", ^{
        
        beforeAll(^{
            id json = [NSBundle jsonObjectForResourceName:@"repo.alertninja"];
            repository = [BGRepository repositoryWithJSON:json];
        });
        
        it(@"はresourceUrlがfull_nameから構築される", ^{
            NSString *urlString = @"https://api.github.com/repos/yaakaito/AlertNinja";
            [[[repository.resourceUrl absoluteString] should] equal:urlString];
        });
        
        it(@"はnameにリポジトリ名を持つ", ^{
            [[repository.name should] equal:@"AlertNinja"];
        });
        
        it(@"はfullNameにリポジトリのユーザー名を含めた名前を持つ", ^{
            [[repository.fullName should] equal:@"yaakaito/AlertNinja"];
        });
        
        it(@"は言語情報を文字列で持つ", ^{
            [[repository.language should] equal:@"Objective-C"];
        });
        
        it(@"はリポジトリの説明を持つ", ^{
            [[repository.repositoryDescription should] equal:@"Invisible UIAlertView and spying."];
        });
        
        it(@"はwatcher数(star数)を持つ", ^{
            [[theValue(repository.watchers) should] equal:theValue(2)];
        });
        
        it(@"はfork数を持つ", ^{
            [[theValue(repository.forks) should] equal:theValue(1)];
        });
        
        it(@"はforkされたリポジトリかを持つ", ^{
            [[theValue(repository.fork) should] beNo];
        });
        
        it(@"はオープンなissueの数を持つ", ^{
            [[theValue(repository.openIssues) should] equal:theValue(1)];
        });
    });
});

SPEC_END
