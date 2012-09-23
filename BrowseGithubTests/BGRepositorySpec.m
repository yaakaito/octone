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
    
    void(^checkRepositorySpecWithAlertNinja)(BGRepository *) = ^(BGRepository *repository) {
        [[repository.name should] equal:@"AlertNinja"];
        [[repository.fullName should] equal:@"yaakaito/AlertNinja"];
        [[repository.language should] equal:@"Objective-C"];
        [[repository.repositoryDescription should] equal:@"Invisible UIAlertView and spying."];
        [[theValue(repository.watchers) should] equal:theValue(2)];
        [[theValue(repository.forks) should] equal:theValue(1)];
        [[theValue(repository.fork) should] beNo];
        [[theValue(repository.openIssues) should] equal:theValue(1)];
    };
    
    context(@"をJSONから初期化したとき", ^{
        
        beforeAll(^{
            id json = [NSBundle jsonObjectForResourceName:@"repo.alertninja"];
            repository = [BGRepository repositoryWithJSON:json];
        });
        
        it(@"はresourceUrlをfull_nameから構築する", ^{
            NSString *urlString = @"https://api.github.com/repos/yaakaito/AlertNinja";
            [[[repository.resourceUrl absoluteString] should] equal:urlString];
        });
        
        it(@"はリポジトリに表すのに必要な情報をセットできている", ^{
            checkRepositorySpecWithAlertNinja(repository);
        });

    });
    
    context(@"をリポジトリ名から初期化したとき", ^{
        beforeAll(^{
            repository = [BGRepository repositoryWithFullName:@"yaakaito/AlertNinja"];
        });
        
        
        it(@"はresourceUrlがリポジトリ名から構築する", ^{
            NSString *urlString = @"https://api.github.com/repos/yaakaito/AlertNinja";
            [[[repository.resourceUrl absoluteString] should] equal:urlString];
        });
    });
    
    context(@"がrepo.alertninja.jsonをパースしたとき", ^{
        beforeAll(^{
            id json = [NSBundle jsonObjectForResourceName:@"repo.alertninja"];
            repository = [BGRepository repositoryWithFullName:@"yaakaito/AlertNinja"];
            [repository setValuesFromJSON:json];
        });
        
        it(@"はリポジトリに表すのに必要な情報をセットできている", ^{
            checkRepositorySpecWithAlertNinja(repository);
        });

    });
});

SPEC_END
