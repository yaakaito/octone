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
        
        it(@"取り出せるエントリーは2つ", ^{
            [[theValue([feedEntries count]) should] equal:theValue(2)];
        });
        
        void(^checkFeedEntryFields)(BGFeedEntry *) = ^(BGFeedEntry *feedEntry) {
            [feedEntry shouldNotBeNil];
            [[feedEntry.entryId should] equal:@"id"];
            [[feedEntry.published should] equal:@"2000-00-00T00:00:00Z"];
            [[feedEntry.updated should] equal:@"2000-00-00T00:00:00Z"];
            [[[feedEntry.linkUri absoluteString] should] equal:@"https://github.com/"];
            [[feedEntry.title should] equal:@"title"];
            [[feedEntry.authorName should] equal:@"author"];
            [[[feedEntry.auhtorUri absoluteString] should] equal:@"https://github.com/"];
            [[[feedEntry.gravatarUri absoluteString] should] equal:@"https://secure.gravatar.com/"];
            
        };
        
        it(@"1つ目のエントリーがパースに成功", ^{
            checkFeedEntryFields([feedEntries objectAtIndex:0]);
        });
        
        it(@"2つ目のエントリーがパースに成功", ^{
            checkFeedEntryFields([feedEntries objectAtIndex:1]);

        });
        
    });
});

SPEC_END
