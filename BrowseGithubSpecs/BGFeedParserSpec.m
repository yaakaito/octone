//
//  BrowseGithub - BGFeedParserSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "NSBundle+Specs.h"
#import "BGFeedParser.h"
#import "BGFeedEntry.h"

SPEC_BEGIN(BGFeedParserSpec)

describe(@"Feed Parser", ^{
    
    context(@"user.private.atomを使ったとき", ^{
        __block NSData *atom;
        beforeEach(^{
            atom = [NSBundle atomForResouceName:@"user.private"];
        });
        
        it(@"パースに成功するのでエラーはない", ^{
            NSError *error;
            [BGFeedParser parseFeedXMLData:atom error:&error];
            [error shouldBeNil];
        });
        
        it(@"パース結果は30件", ^{
            NSArray *feedEntries = [BGFeedParser parseFeedXMLData:atom error:NULL];
            [[theValue([feedEntries count]) should] equal:theValue(30)];
        });
        
    });
    
    context(@"user.private.short.atomをパースしたとき", ^{
        __block NSData *atom;
        __block NSArray *feedEntries;
        beforeEach(^{
            atom = [NSBundle atomForResouceName:@"user.private.short"];
            feedEntries = [BGFeedParser parseFeedXMLData:atom error:NULL];
        });
        
        it(@"取り出せるエントリーは3つ", ^{
            [[theValue([feedEntries count]) should] equal:theValue(3)];
        });
        
        it(@"1つ目のエントリーがパースに成功", ^{
            BGFeedEntry *entry = [feedEntries objectAtIndex:0];
            [entry shouldNotBeNil];
            [[entry.entryId should] equal:@"tag:github.com,2008:CreateEvent/1590394401"];
            [[entry.published should] equal:@"2012-08-28T04:44:08Z"];
            [[entry.updated should] equal:@"2012-08-28T04:44:08Z"];
            [[[entry.linkUri absoluteString] should] equal:@"https://github.com/visionmedia/dom"];
            [[entry.title should] equal:@"visionmedia created repository dom"];
            [[entry.authorName should] equal:@"visionmedia"];
            [[[entry.auhtorUri absoluteString] should] equal:@"https://github.com/visionmedia"];
            [[[entry.gravatarUri absoluteString] should] equal:@"https://secure.gravatar.com/avatar/f1e3ab214a976a39cfd713bc93deb10f?s=30&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"];
        });
        
        it(@"2つ目のエントリーがパースに成功", ^{
            BGFeedEntry *entry = [feedEntries objectAtIndex:1];
            [entry shouldNotBeNil];
            [[entry.entryId should] equal:@"tag:github.com,2008:PullRequestEvent/1590373427"];
            [[entry.published should] equal:@"2012-08-28T02:55:21Z"];
            [[entry.updated should] equal:@"2012-08-28T02:55:21Z"];
            [[[entry.linkUri absoluteString] should] equal:@"https://github.com/CocoaPods/Specs/pull/429"];
            [[entry.title should] equal:@"bricooke closed pull request 429 on CocoaPods/Specs"];
            [[entry.authorName should] equal:@"bricooke"];
            [[[entry.auhtorUri absoluteString] should] equal:@"https://github.com/bricooke"];
            [[[entry.gravatarUri absoluteString] should] equal:@"https://secure.gravatar.com/avatar/916de6eec58087391b518c5ac3ac7f47?s=30&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"];
            
        });
        
        it(@"3つ目のエントリーがパースに成功 ", ^{
            BGFeedEntry *entry = [feedEntries objectAtIndex:2];
            [entry shouldNotBeNil];
            [[entry.entryId should] equal:@"tag:github.com,2008:IssueCommentEvent/1590373426"];
            [[entry.published should] equal:@"2012-08-28T02:55:21Z"];
            [[entry.updated should] equal:@"2012-08-28T02:55:21Z"];
            [[[entry.linkUri absoluteString] should] equal:@"https://github.com/CocoaPods/Specs/issues/429#issuecomment-8077910"];
            [[entry.title should] equal:@"bricooke commented on pull request 429 on CocoaPods/Specs"];
            [[entry.authorName should] equal:@"bricooke"];
            [[[entry.auhtorUri absoluteString] should] equal:@"https://github.com/bricooke"];
            [[[entry.gravatarUri absoluteString] should] equal:@"https://secure.gravatar.com/avatar/916de6eec58087391b518c5ac3ac7f47?s=30&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"];
            
        });
        
    });
});

SPEC_END
