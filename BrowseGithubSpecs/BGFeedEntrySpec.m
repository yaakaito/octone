//
//  BrowseGithub - BGFeedEntrySpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGFeedEntry.h"

SPEC_BEGIN(BGFeedEntrySpec)

describe(@"Feed Entry", ^{

    context(@"typeのパース", ^{
        __block BGFeedEntry *feedEntry;
        beforeEach(^{
            feedEntry = [[BGFeedEntry alloc] init];
        });
        
        it(@"初期化状態ではidがセットされていないので分からない", ^{
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeUnknown)];
        });
        
        it(@"idにCommitが含まれるとき、typeはCommit", ^{
            feedEntry.entryId = @"tag:github.com,2008:CommitEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにPushが含まれるとき、typeはPush", ^{
            feedEntry.entryId = @"tag:github.com,2008:PushEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにForkAppleが含まれるとき、typeはForkApply", ^{
            feedEntry.entryId = @"tag:github.com,2008:ForkApplyEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにForkが含まれるとき、typeはFork", ^{
            feedEntry.entryId = @"tag:github.com,2008:ForkEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにPullRequestが含まれるとき、typeはPullRequest", ^{
            feedEntry.entryId = @"tag:github.com,2008:PullRequestEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにIssueが含まれるとき、typeはIssue", ^{
            feedEntry.entryId = @"tag:github.com,2008:IssueEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにFollowが含まれるとき、typeはFollow", ^{
            feedEntry.entryId = @"tag:github.com,2008:Follow/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにWatchが含まれるとき、typeはWatch", ^{
            feedEntry.entryId = @"tag:github.com,2008:WatchEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにStarが含まれるとき、typeはStar", ^{
            feedEntry.entryId = @"tag:github.com,2008:StarEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにCommitCommentが含まれるとき、typeはCommitComment", ^{
            feedEntry.entryId = @"tag:github.com,2008:CommitCommentEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにIssueCommentが含まれるとき、typeはIssueComment", ^{
            feedEntry.entryId = @"tag:github.com,2008:IssueComment/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにCreateが含まれるとき、typeはCreate", ^{
            feedEntry.entryId = @"tag:github.com,2008:CreateEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにDeleteが含まれるとき、typeはDelete", ^{
            feedEntry.entryId = @"tag:github.com,2008:DeleteEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにWikiが含まれるとき、typeはWiki", ^{
            feedEntry.entryId = @"tag:github.com,2008:WikiEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにDownloadが含まれるとき、typeはDownload", ^{
            feedEntry.entryId = @"tag:github.com,2008:DownloadEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにTeamAddが含まれるとき、typeはTeamAdd", ^{
            feedEntry.entryId = @"tag:github.com,2008:TeamAddEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
        
        it(@"idにMemberが含まれるとき、typeはMember", ^{
            feedEntry.entryId = @"tag:github.com,2008:MemberEvent/1000000";
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeCommit)];
        });
    });
});

SPEC_END
