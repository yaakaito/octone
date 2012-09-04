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
    
    context(@"がuser.private.atomをパースしたとき", ^{
        __block NSData *atom;
        beforeEach(^{
            atom = [NSBundle atomForResouceName:@"user.private"];
        });
        
        it(@"は、パースに成功するのでエラーはない", ^{
            NSError *error;
            [BGFeedParser parseFeedXMLData:atom error:&error];
            [error shouldBeNil];
        });
        
        it(@"は、30件のエントリーを返す", ^{
            NSArray *feedEntries = [BGFeedParser parseFeedXMLData:atom error:NULL];
            [[theValue([feedEntries count]) should] equal:theValue(30)];
        });
        
    });
    
    context(@"がuser.private.short.atomをパースしたとき", ^{
        __block NSData *atom;
        __block NSArray *feedEntries;
        beforeEach(^{
            atom = [NSBundle atomForResouceName:@"user.private.short"];
            feedEntries = [BGFeedParser parseFeedXMLData:atom error:NULL];
        });
        
        it(@"は、2件のエントリーを返す", ^{
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
        
        it(@"は、1つめのエントリーのパースに成功している", ^{
            checkFeedEntryFields([feedEntries objectAtIndex:0]);
        });
        
        it(@"は、2つ目のエントリーのパースに成功している", ^{
            checkFeedEntryFields([feedEntries objectAtIndex:1]);

        });
        
    });
});

SPEC_END
