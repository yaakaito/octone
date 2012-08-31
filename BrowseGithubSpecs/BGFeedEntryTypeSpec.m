//
//  BrowseGithub - BGFeedEntrySpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGFeedEntry.h"

SPEC_BEGIN(BGFeedEntryTypeSpec)

describe(@"Feed Entry", ^{

    context(@"typeのパース", ^{
        it(@"初期化状態ではidがセットされていないので分からない", ^{
            BGFeedEntry *feedEntry = [[BGFeedEntry alloc] init];
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeUnknown)];
        });

        void(^checkFeedType)(BGFeedEntryType, NSString*) = ^(BGFeedEntryType type, NSString* entryId) {
            BGFeedEntry *feedEntry = [[BGFeedEntry alloc] init];
            feedEntry.entryId = entryId;
            [[theValue(feedEntry.type) should] equal:theValue(type)];
        };
        
        it(@"idにCommitが含まれるとき、typeはCommit", ^{
            checkFeedType(kBGFeedEntryTypeCommit, @"tag:github.com,2008:CommitEvent/1000000");
        });
        
        it(@"idにPushが含まれるとき、typeはPush", ^{
            checkFeedType(kBGFeedEntryTypePush,  @"tag:github.com,2008:PushEvent/1000000");
        });
        
        it(@"idにForkAppleが含まれるとき、typeはForkApply", ^{
            checkFeedType(kBGFeedEntryTypeForkApply, @"tag:github.com,2008:ForkApplyEvent/1000000");
        });
        
        it(@"idにForkが含まれるとき、typeはFork", ^{
            checkFeedType(kBGFeedEntryTypeFork,  @"tag:github.com,2008:ForkEvent/1000000");
        });
        
        it(@"idにPullRequestが含まれるとき、typeはPullRequest", ^{
            checkFeedType(kBGFeedEntryTypePullRequest, @"tag:github.com,2008:PullRequestEvent/1000000");
        });
        
        it(@"idにIssueが含まれるとき、typeはIssue", ^{
            checkFeedType(kBGFeedEntryTypeIssue, @"tag:github.com,2008:IssueEvent/1000000");
        });
        
        it(@"idにFollowが含まれるとき、typeはFollow", ^{
            checkFeedType(kBGFeedEntryTypeFollow, @"tag:github.com,2008:Follow/1000000");
        });
        
        it(@"idにWatchが含まれるとき、typeはWatch", ^{
            checkFeedType(kBGFeedEntryTypeWatch, @"tag:github.com,2008:WatchEvent/1000000");
        });
        
        it(@"idにStarが含まれるとき、typeはStar", ^{
            checkFeedType(kBGFeedEntryTypeStar, @"tag:github.com,2008:StarEvent/1000000");
        });
        
        it(@"idにCommitCommentが含まれるとき、typeはCommitComment", ^{
            checkFeedType(kBGFeedEntryTypeCommitComment, @"tag:github.com,2008:CommitCommentEvent/1000000");
        });
        
        it(@"idにIssueCommentが含まれるとき、typeはIssueComment", ^{
            checkFeedType(kBGFeedEntryTypeIssueComment, @"tag:github.com,2008:IssueComment/1000000");
        });
        
        it(@"idにCreateが含まれるとき、typeはCreate", ^{
            checkFeedType(kBGFeedEntryTypeCreate, @"tag:github.com,2008:CreateEvent/1000000");
        });
        
        it(@"idにDeleteが含まれるとき、typeはDelete", ^{
            checkFeedType(kBGFeedEntryTypeDelete, @"tag:github.com,2008:DeleteEvent/1000000");
        });
        
        it(@"idにWikiが含まれるとき、typeはWiki", ^{
            checkFeedType(kBGFeedEntryTypeWiki, @"tag:github.com,2008:WikiEvent/1000000");
        });
        
        it(@"idにDownloadが含まれるとき、typeはDownload", ^{
            checkFeedType(kBGFeedEntryTypeDownload, @"tag:github.com,2008:DownloadEvent/1000000");
        });
        
        it(@"idにTeamAddが含まれるとき、typeはTeamAdd", ^{
            checkFeedType(kBGFeedEntryTypeTeamAdd, @"tag:github.com,2008:TeamAddEvent/1000000");
        });
        
        it(@"idにMemberが含まれるとき、typeはMember", ^{
            checkFeedType(kBGFeedEntryTypeMember, @"tag:github.com,2008:MemberEvent/1000000");
        });
    });
});

SPEC_END
