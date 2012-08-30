//
//  BGFeedEntry.h
//  BrowseGithub
//
//  Created by yaakaito on 12/08/28.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    kBGFeedEntryTypeUnknown = -1
    , kBGFeedEntryTypeCommit = 0
    , kBGFeedEntryTypePush
    , kBGFeedEntryTypeForkApply
    , kBGFeedEntryTypeFork
    , kBGFeedEntryTypePullRequest
    , kBGFeedEntryTypeIssue
    , kBGFeedEntryTypeFollow
    , kBGFeedEntryTypeWatch
    , kBGFeedEntryTypeStar
    , kBGFeedEntryTypeCommitComment
    , kBGFeedEntryTypeIssueComment
    , kBGFeedEntryTypeCreate
    , kBGFeedEntryTypeDelete
    , kBGFeedEntryTypeWiki
    , kBGFeedEntryTypeDownload
    , kBGFeedEntryTypeTeamAdd
    , kBGFeedEntryTypeMember
} BGFeedEntryType;

@interface BGFeedEntry : NSObject

@property (nonatomic, strong) NSString *entryId;
@property (nonatomic, strong) NSString *published;
@property (nonatomic, strong) NSString *updated;
@property (nonatomic, strong) NSURL *linkUri;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *authorName;
@property (nonatomic, strong) NSURL *auhtorUri;
@property (nonatomic, strong) NSURL *gravatarUri;
@property (nonatomic) BGFeedEntryType type;
@end
