//
//  BrowseGithub - BGEventMessageFormatterSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGEventMessageFormatter.h"
#import "BGEvent.h"

@interface BGEvent()
@property (nonatomic, strong) NSString *typeString;
@property (nonatomic, strong) id payload;
@property (nonatomic, strong) NSString *actorLogin;
@property (nonatomic, strong) NSURL *actorGravatarUrl;
@property (nonatomic, strong) NSString *repositoryName;
@end

SPEC_BEGIN(BGEventMessageFormatterSpec)

describe(@"Event Message Formatter", ^{
    __block BGEvent *event;
    __block NSAttributedString *message;
    __block NSString *description;
    
    context(@"CommitCommentEventをフォーマットするとき", ^{
        beforeAll(^{
            event = [[BGEvent alloc] init];
            event.typeString = @"CommitCommentEvent";
            event.repositoryName = @"yaakaito/Repository";
            event.actorLogin = @"yaakaito";
            event.payload = @{ @"comment" : @{ @"body" : @"あとでやる" , @"commit_id" : @"9367860fc2350c2adfa086034a91deab4fd6713a"} };
            message = [BGEventMessageFormatter messageWithEvent:event];
            description = [BGEventMessageFormatter descriptionWithEvent:event];

        });
        
        it(@"は、メッセージは'$actorLogin commented on commit $repositoryName@$payload.comment.commit_id[0..10]'", ^{
            [[[message string] should] equal:@"yaakaito commented on commit yaakaito/Repository@9367860fc"];
        });
        
        it(@"は、詳細は$payload.comment.body", ^{
            [[description should] equal:@"あとでやる"];
        });
    });
    
    context(@"CreateEventをフォーマットするとき", ^{
        context(@"にリポジトリを作った場合", ^{
            beforeAll(^{
                event = [[BGEvent alloc] init];
                event.typeString = @"CreateEvent";
                event.repositoryName = @"yaakaito/Repository";
                event.actorLogin = @"yaakaito";
                event.payload = @{ @"ref_type" : @"repository"};
                message = [BGEventMessageFormatter messageWithEvent:event];
                description = [BGEventMessageFormatter descriptionWithEvent:event];
            });
            
            
            it(@"は、メッセージは'$actorLogin created $payload.ref_type $repositoryName'", ^{
                [[[message string] should] equal:@"yaakaito created repository yaakaito/Repository"];
            });
            
            it(@"は、詳細情報はなし", ^{
                [description shouldBeNil];
            });
            
        });
        
        context(@"にリポジトリ以外を作った場合", ^{
            beforeAll(^{
                event = [[BGEvent alloc] init];
                event.typeString = @"CreateEvent";
                event.repositoryName = @"yaakaito/Repository";
                event.actorLogin = @"yaakaito";
                event.payload = @{ @"ref_type" : @"branch" , @"ref" : @"hoge" };
                message = [BGEventMessageFormatter messageWithEvent:event];
                description = [BGEventMessageFormatter descriptionWithEvent:event];
            });
            
            it(@"は、メッセージは'$actorLogin created $payload.ref_type $payload.ref at $repositoryName'", ^{
                [[[message string] should] equal:@"yaakaito created branch hoge at yaakaito/Repository"];
            });
            
            it(@"は、詳細情報はなし", ^{
                [description shouldBeNil];
            });

        });
    });
    
    context(@"FollowEventをフォーマットするとき", ^{
        
        it(@"は、メッセージは'$actorLogin started following $payload.target.login'", ^{
            [[[message string] should] equal:@"yaakaito forked yaakaito2"];
        });
        
        
        it(@"は、詳細情報はなし", ^{
            [description shouldBeNil];
        });
        
    });
    context(@"ForkEventをフォーマットするとき", ^{
        
        it(@"は、メッセージは'$actorLogin forked $repositoryName#65'", ^{
            [[[message string] should] equal:@"yaakaito forked yaakaito/Repository#65"];
        });
        
        
        it(@"は、詳細情報はなし", ^{
            [description shouldBeNil];
        });
        
        
    });
    context(@"ForkApplyEventをフォーマットするとき", ^{
        xit(@"", ^{
            ;
        });
    });
    
    context(@"GistEventをフォーマットするとき", ^{
        it(@"は、メッセージは'$actorLogin $payload.action gist: $payload.gist.id'", ^{
            [[[message string] should] equal:@"yaakaito created gist: 1000"];
        });
        
        it(@"は、詳細情報はなし", ^{
            [description shouldBeNil];
        });
    });
    
    context(@"GollumEventをフォーマットするとき", ^{
        it(@"は、メッセージは'$actorLogin edited the $repositoryName wiki'", ^{
            [[[message string] should] equal:@"yaakaito edited the yaakaito/Repository wiki"];
        });
        
        it(@"は、詳細情報はなし", ^{
            [description shouldBeNil];
        });
    });
    
    context(@"IssueCommentEventをフォーマットするとき", ^{
        
        // payload.issue.number
        it(@"は、メッセージは'$actorLogin comment on issue $repositoryName#64'", ^{
            [[[message string] should] equal:@"yaakaito comment on issue yaakaito/Repository#64"];
        });
        
        it(@"は、詳細は$payload.comment.body", ^{
            [[description should] equal:@"あとでやる"];
        });
    });
    
    
    context(@"IssuesEventをフォーマットするとき", ^{
        it(@"は、メッセージは'$actorLogin $payload.action issue $repositoryName#64'", ^{
            [[[message string] should] equal:@"yaakaito opened issue yaakaito/Repository#64"];
        });
        
        it(@"は、詳細は$payload.issue.title", ^{
            [[description should] equal:@"あとでやる"];
        });
    });
    
    context(@"MemberEventをフォーマットするとき", ^{
        xit(@"", ^{
            ;
        });
    });
    
    context(@"PublicEventをフォーマットするとき", ^{
        xit(@"", ^{
            ;
        });
    });
    
    context(@"PullRequestEventをフォーマットするとき", ^{
        // payload.pull_request._links.self.href https://api.github.com/repos/CocoaPods/Specs/pulls/538
        it(@"は、メッセージは'$actorLogin $payload.action pull request $repositoryName#65'", ^{
            [[[message string] should] equal:@"yaakaito closed pull request yaakaito/Repository#65"];
        });
        
        it(@"は、詳細は$payload.comment.body", ^{
            [[description should] equal:@"あとでやる"];
        });
    });
    
    context(@"PullRequestReviewCommentEventをフォーマットするとき", ^{
        //    comment: {
        //    position: 13,
        //    commit_id: "5a6ed54fd8402ac3e1e882e17b7e1746bf1aa4df",
        //    url: "https://api.github.com/repos/github/ReactiveCocoa/pulls/comments/1680920",
        //    original_commit_id: "5a6ed54fd8402ac3e1e882e17b7e1746bf1aa4df",
        //    updated_at: "2012-09-25T06:41:51Z",
        //    _links: {
        //        self: {
        //        href: "https://api.github.com/repos/github/ReactiveCocoa/pulls/comments/1680920"
        //        },
        //    pull_request: {
        //    href: "https://api.github.com/repos/github/ReactiveCocoa/pulls/65"
        //    },
        
        // payload.comment._links.pull_request.href : 
        it(@"は、メッセージは'$actorLogin commented on pull request $repositoryName#65'", ^{
            [[[message string] should] equal:@"yaakaito commented on pull request yaakaito/Repository#65"];
        });
        
        it(@"は、詳細は$payload.pull_reqeust.title", ^{
            [[description should] equal:@"あとでやる"];
        });

    });

    context(@"PushEventをフォーマットするとき", ^{
        // payload.ref = "refs/heads/master"
        it(@"は、メッセージは'$actorLogin pushed to $payload.ref at $repositoryName'", ^{
            [[[message string] should] equal:@"yaakaito pushed to master at yaakaito/Repository"];
        });
        
        it(@"は、詳細情報はなし", ^{
            [description shouldBeNil];
        });
    });
    
    context(@"TeamAddEventをフォーマットするとき", ^{
        xit(@"", ^{
            ;
        });
    });
    
    context(@"WatchEventをフォーマットするとき", ^{

        beforeAll(^{
            event = [[BGEvent alloc] init];
            event.typeString = @"WatchEvent";
            event.repositoryName = @"yaakaito/Repository";
            event.actorLogin = @"yaakaito";
            event.payload = @{ @"action" : @"started" };
            message = [BGEventMessageFormatter messageWithEvent:event];
            description = [BGEventMessageFormatter descriptionWithEvent:event];
        });
        
        it(@"は、メッセージは'$actorLogin starred $repositoryName'", ^{
            [[[message string] should] equal:@"yaakaito starred yaakaito/Repository"];
        });
        
        it(@"は、詳細情報はなし", ^{
            [description shouldBeNil];
        });
    });

});

SPEC_END