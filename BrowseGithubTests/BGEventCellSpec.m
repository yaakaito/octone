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
@property (nonatomic, strong) UILabel *message;
@property (nonatomic, strong) UILabel *eventDescription;
@end


SPEC_BEGIN(BGEventCellSpec)

describe(@"Event Cell", ^{
    __block BGEventCell *cell;
    __block BGEvent *event;
    
    context(@"を初期化したとき", ^{
       
        beforeEach(^{
            cell = [[BGEventCell alloc] init];
        });
        
        it(@"は、メッセージを表示するためのラベルを用意する", ^{
            [cell.message shouldNotBeNil];
            [[[cell.message superview] should] equal:cell.contentView];
        });
        
        it(@"は、詳細を表示するためのラベルを用意する", ^{
            [cell.eventDescription shouldNotBeNil];
            [[[cell.eventDescription superview] should] equal:cell.contentView];
        });
        
        xit(@"は、Gravatarのアイコンを表示するためにビューを用意する", ^{
            [cell.gravatar shouldNotBeNil];
            [[[cell.gravatar superview] should] equal:cell.contentView];
        });
    });
    
    context(@"にイベント情報をセットしたとき", ^{
        
        context(@"詳細付きのイベント", ^{
            
            beforeAll(^{
                cell = [[BGEventCell alloc] init];
                event = [[BGEvent alloc] init];
                event.typeString = @"ForkEvent";
                event.actorLogin = @"yaakaito";
                event.payload    = @{};
                event.repositoryName = @"yaakaito/Repository";
                cell.event = event;
            });
            
            it(@"は、messageにフォーマットされた情報を表示する", ^{
                [[[cell.message.attributedText string] should] equal:@"yaakaito forked yaakaito/Repository"];
            });
            
            it(@"は、eventDescriptionに何も表示しない", ^{
                [cell.eventDescription.text shouldBeNil];
            });
        });
        
        context(@"詳細なしのイベント", ^{
        
            beforeAll(^{
                cell = [[BGEventCell alloc] init];
                event = [[BGEvent alloc] init];
                event.typeString = @"CommitCommentEvent";
                event.actorLogin = @"yaakaito";
                event.payload    = @{ @"comment" : @{ @"body" : @"description" , @"commit_id" : @"9367860fc2350c2adfa086034a91deab4fd6713a"} };
                event.repositoryName = @"yaakaito/Repository";
                cell.event = event;
            });
            
            
            it(@"は、messageにフォーマットされた情報を表示する", ^{
                [[[cell.message.attributedText string] should] equal:@"yaakaito commented on commit yaakaito/Repository@9367860fc"];
            });
            
            it(@"は、eventDescriptionにイベントの詳細を表示する", ^{
                
                [[cell.eventDescription.text should] equal:@"description"];
            });
        });
        
        context(@"Gravatarのアイコン", ^{
            
            beforeAll(^{
                cell = [[BGEventCell alloc] init];
                event = [[BGEvent alloc] init];
                event.actorGravatarUrl = [NSURL URLWithString:@"http://localhost/image"];
            });
            
            xit(@"は、イメージのロードを開始する", ^{
                [[cell.gravatar should] receive:@selector(loadImage)];
                cell.event = event;
            });
        });
    });
});

SPEC_END
