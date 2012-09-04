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

    context(@"のtype", ^{
        it(@"は、初期化状態ではidがセットされていないので不明", ^{
            BGFeedEntry *feedEntry = [[BGFeedEntry alloc] init];
            [[theValue(feedEntry.type) should] equal:theValue(kBGFeedEntryTypeUnknown)];
        });

        void(^checkFeedType)(BGFeedEntryType, NSString*) = ^(BGFeedEntryType type, NSString* entryId) {
            BGFeedEntry *feedEntry = [[BGFeedEntry alloc] init];
            feedEntry.entryId = entryId;
            [[theValue(feedEntry.type) should] equal:theValue(type)];
        };
        
        it(@"は、idにCommitが含まれるときCommit", ^{
            checkFeedType(kBGFeedEntryTypeCommit, @"tag:github.com,2008:CommitEvent/1000000");
        });
        
        it(@"は、idにPushが含まれるときPush", ^{
            checkFeedType(kBGFeedEntryTypePush,  @"tag:github.com,2008:PushEvent/1000000");
        });
        
        it(@"は、idにForkAppleが含まれるときForkApply", ^{
            checkFeedType(kBGFeedEntryTypeForkApply, @"tag:github.com,2008:ForkApplyEvent/1000000");
        });
        
        it(@"は、idにForkが含まれるときFork", ^{
            checkFeedType(kBGFeedEntryTypeFork,  @"tag:github.com,2008:ForkEvent/1000000");
        });
        
        it(@"は、idにPullRequestが含まれるときPullRequest", ^{
            checkFeedType(kBGFeedEntryTypePullRequest, @"tag:github.com,2008:PullRequestEvent/1000000");
        });
        
        it(@"は、idにIssueが含まれるときIssue", ^{
            checkFeedType(kBGFeedEntryTypeIssue, @"tag:github.com,2008:IssueEvent/1000000");
        });
        
        it(@"は、idにFollowが含まれるときFollow", ^{
            checkFeedType(kBGFeedEntryTypeFollow, @"tag:github.com,2008:Follow/1000000");
        });
        
        it(@"は、idにWatchが含まれるときWatch", ^{
            checkFeedType(kBGFeedEntryTypeWatch, @"tag:github.com,2008:WatchEvent/1000000");
        });
        
        it(@"は、idにStarが含まれるときStar", ^{
            checkFeedType(kBGFeedEntryTypeStar, @"tag:github.com,2008:StarEvent/1000000");
        });
        
        it(@"は、idにCommitCommentが含まれるとCommitComment", ^{
            checkFeedType(kBGFeedEntryTypeCommitComment, @"tag:github.com,2008:CommitCommentEvent/1000000");
        });
        
        it(@"は、idにIssueCommentが含まれるときIssueComment", ^{
            checkFeedType(kBGFeedEntryTypeIssueComment, @"tag:github.com,2008:IssueComment/1000000");
        });
        
        it(@"は、idにCreateが含まれるときCreate", ^{
            checkFeedType(kBGFeedEntryTypeCreate, @"tag:github.com,2008:CreateEvent/1000000");
        });
        
        it(@"は、idにDeleteが含まれるときDelete", ^{
            checkFeedType(kBGFeedEntryTypeDelete, @"tag:github.com,2008:DeleteEvent/1000000");
        });
        
        it(@"は、idにWikiが含まれるときWiki", ^{
            checkFeedType(kBGFeedEntryTypeWiki, @"tag:github.com,2008:WikiEvent/1000000");
        });
        
        it(@"は、idにDownloadが含まれるときDownload", ^{
            checkFeedType(kBGFeedEntryTypeDownload, @"tag:github.com,2008:DownloadEvent/1000000");
        });
        
        it(@"は、idにTeamAddが含まれるときTeamAdd", ^{
            checkFeedType(kBGFeedEntryTypeTeamAdd, @"tag:github.com,2008:TeamAddEvent/1000000");
        });
        
        it(@"は、idにMemberが含まれるときMember", ^{
            checkFeedType(kBGFeedEntryTypeMember, @"tag:github.com,2008:MemberEvent/1000000");
        });
    });
});

SPEC_END
