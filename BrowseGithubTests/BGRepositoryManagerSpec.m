//
//  BrowseGithub - BGRepositoryManagerSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGRepositoryManager.h"
#import "BGRepository.h"
#import "MockRepositories.h"

@interface BGRepositoryManager()
@property (nonatomic, strong) NSMutableArray *repositories;
@end


@interface BGRepository()
@property (nonatomic, strong) NSString *name;
@end

SPEC_BEGIN(BGRepositoryManagerSpec)

describe(@"Repository Manager", ^{
    
    __block BGRepositoryManager *manager;
    
    context(@"が、user.repos.jsonを取得したとき", ^{
        __block MockRepositories *mock;
        beforeAll(^{
            manager = [[BGRepositoryManager alloc] init];
            mock = [[MockRepositories alloc] init];
            [manager reloadResource:mock
                           complete:^{
                               ;
                           } failure:^{
                               ;
                           }];
            
        });
        
        it(@"はJSONをパースし、10件のリポジトリを取り出せる", ^{
            [[[manager should] have:10] repositories];
            for (id repository in manager.repositories) {
                [[repository should] beKindOfClass:[BGRepository class]];
            }
        });
        
        context(@"にさらに追加でuser.repos.jsonを取得したとき", ^{
            beforeAll(^{
                [manager addResource:mock
                            complete:^{
                                ;
                            } failure:^{
                                ;
                            }];
            });
            
            it(@"はJSONをパースし、さらに10件のリポジトリを追加し、全体で20件となる", ^{
                [[[manager should] have:20] repositories];
            });
        });
    });
    
    context(@"に、表示用のデータを要求したとき", ^{
        
        BGRepository*(^createRepository)(NSString*) = ^(NSString* name) {
            BGRepository *repository = [[BGRepository alloc] init];
            repository.name = name;
            return repository;
        };
        
        __block NSArray *repositories;
        beforeEach(^{
            manager = [[BGRepositoryManager alloc] init];
            repositories = @[createRepository(@"hoge"), createRepository(@"piyo"), createRepository(@"fuga")];
            manager.repositories = [repositories mutableCopy];
        });
        
        it(@"は、リポジトリの件数を返す", ^{
            [[theValue([manager numberOfRepositories]) should] equal:theValue(3)];
        });
        
        it(@"は、対象のインデックスに相当するリポジトリを返す", ^{
            for (NSUInteger i = 0; i < 3; i++) {
                BGRepository *actual = [manager repositoryAtIndex:i];
                BGRepository *expected = [repositories objectAtIndex:i];
                [[actual.name should] equal:expected.name];
            }
        });
    });
    
});

SPEC_END
