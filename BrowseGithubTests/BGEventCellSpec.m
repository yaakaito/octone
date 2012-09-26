//
//  BrowseGithub - BGEventCellSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGEvent.h"
#import "BGEventCell.h"
#import "BGGravatarImageView.h"

@interface BGEvent()
@property (nonatomic, strong) NSString *typeString;
@property (nonatomic, strong) id payload;
@property (nonatomic, strong) NSString *actorLogin;
@property (nonatomic, strong) NSURL *actorGravatarUrl;
@property (nonatomic, strong) NSString *repositoryName;
@end

@interface BGEventCell()
@property (nonatomic, strong) BGGravatarImageView *gravatar;
@property (nonatomic, strong) UILabel *summary;
@property (nonatomic, strong) UILabel *message;
@end


SPEC_BEGIN(BGEventCellSpec)

describe(@"Event Cell", ^{
    __block BGEventCell *cell;
    __block BGEvent *event;
    
    context(@"を初期化したとき", ^{
       
        beforeEach(^{
            cell = [[BGEventCell alloc] init];
        });
        
        it(@"は、サマリーを表示するためのラベルを用意する", ^{
            [cell.summary shouldNotBeNil];
            [[[cell.summary superview] should] equal:cell.contentView];
        });
        
        it(@"は、メッセージを表示するためのラベルを用意する", ^{
            [cell.message shouldNotBeNil];
            [[[cell.message superview] should] equal:cell.contentView];
        });
        
        it(@"は、Gravatarのアイコンを表示するためにビューを用意する", ^{
            [cell.gravatar shouldNotBeNil];
            [[[cell.gravatar superview] should] equal:cell.contentView];
        });
    });
    
    context(@"にイベント情報をセットしたとき", ^{
        
        beforeEach(^{
            cell = [[BGEventCell alloc] init];
        });
        
        context(@"詳細付きのイベント", ^{
            
            beforeAll(^{
                event = [[BGEvent alloc] init];
                event.typeString = @"ForkEvent";
                event.actorLogin = @"yaakaito";
                event.payload    = @{};
                event.repositoryName = @"yaakaito/Repository";
                cell.event = event;
            });
            
            it(@"は、summaryにフォーマットされた情報を表示する", ^{
                [[[cell.summary.attributedText string] should] equal:@"yaakaito forked yaakaito/Repository"];
            });
            
            it(@"は、messageに何も表示しない", ^{
                [cell.message.text shouldBeNil];
            });
        });
        
        context(@"詳細なしのイベント", ^{
        
            beforeAll(^{
                
                event = [[BGEvent alloc] init];
                event.typeString = @"CommitCommentEvent";
                event.actorLogin = @"yaakaito";
                event.payload    = @{ @"comment" : @{ @"body" : @"message" , @"commit_id" : @"9367860fc2350c2adfa086034a91deab4fd6713a"} };
                event.repositoryName = @"yaakaito/Repository";
                cell.event = event;
            });
            
            
            it(@"は、summaryにフォーマットされた情報を表示する", ^{
                [[[cell.summary.attributedText string] should] equal:@"yaakaito commented on commit yaakaito/Repository@9367860fc"];
            });
            
            it(@"は、messageにイベントの詳細を表示する", ^{
                
                [[cell.message.text should] equal:@"message"];
            });
        });
        
        context(@"Gravatarのアイコン", ^{
            
            beforeAll(^{
                event = [[BGEvent alloc] init];
                event.actorGravatarUrl = [NSURL URLWithString:@"http://localhost/image"];
            });
            
            it(@"は、イメージのロードを開始する", ^{
                [[cell.gravatar should] receive:@selector(loadImage)];
                cell.event = event;
            });
        });
    });
});

SPEC_END
