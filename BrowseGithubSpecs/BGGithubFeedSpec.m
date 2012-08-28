//
//  BrowseGithub - BGGithubFeedSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "NSBundle+Specs.h"
#import "BGFeedEntry.h"
#import "BGFeedParser.h"

SPEC_BEGIN(BGGithubFeedSpec)

describe(@"Github Feeds", ^{
    
    context(@"Feed Parser", ^{
    
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
                NSArray *feeds = [BGFeedParser parseFeedXMLData:atom error:NULL];
                [[theValue([feeds count]) should] equal:theValue(30)];
            });
            
        });
    });
    
    context(@"Feed Entry Manager", ^{

    });
    
    context(@"Feed Controller", ^{
        
    });
});

SPEC_END
