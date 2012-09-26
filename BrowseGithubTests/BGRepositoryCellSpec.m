//
//  BrowseGithub - BGRepositoryCellSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGRepositoryCell.h"
#import "BGRepository.h"

@interface BGRepository()
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *repositoryDescription;
@property (nonatomic) NSInteger watchers;
@property (nonatomic) NSInteger forks;
@property (nonatomic) BOOL fork;
@property (nonatomic) NSInteger openIssues;
@end

@interface BGRepositoryCell()
@property (nonatomic, strong) UILabel *repositoryName;
@property (nonatomic, strong) UILabel *repositoryDescription;
@end

SPEC_BEGIN(BGRepositoryCellSpec)

describe(@"Repository Cell", ^{
    
    __block BGRepositoryCell *cell;
    __block BGRepository *repository;
    
    context(@"を初期化したとき", ^{
        
        beforeEach(^{
            cell = [[BGRepositoryCell alloc] init];
        });
        
        it(@"は、リポジトリ名を表示するためのラベルを用意する", ^{
            [cell.repositoryName shouldNotBeNil];
            [[[cell.repositoryName superview] should] equal:cell.contentView];
        });
        
        it(@"は、詳細を表示するためのラベルを用意する", ^{
            [cell.repositoryDescription shouldNotBeNil];
            [[[cell.repositoryDescription superview] should] equal:cell.contentView];
        });
        
    });
    
    context(@"にリポジトリ情報をセットしたとき", ^{
        
        beforeAll(^{
            cell = [[BGRepositoryCell alloc] init];
            repository = [[BGRepository alloc] init];
            repository.name = @"Repository";
            repository.repositoryDescription = @"description";
            cell.repository = repository;
        });
        
        it(@"は、repositoryNameにリポジトリ名を表示する", ^{
            [[cell.repositoryName.text should] equal:@"Repository"];
        });
        
        it(@"は、repositoryDescriptionにリポジトリの説明を表示する", ^{
            [[cell.repositoryDescription.text should] equal:@"description"];
        });
    });

});


SPEC_END
