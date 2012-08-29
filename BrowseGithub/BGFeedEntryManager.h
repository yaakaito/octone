//
//  BGFeedEntryManager.h
//  BrowseGithub
//
//  Created by yaakaito on 12/08/28.
//
//

#import <Foundation/Foundation.h>
#import "BGFeedEntry.h"

@interface BGFeedEntryManager : NSObject
@property (nonatomic, strong, readonly) NSMutableArray *feedEntries;
- (void)reloadFeedEntries;
- (NSUInteger)numberOfFeedEntries;
- (BGFeedEntry*)entryForIndexPath:(NSIndexPath*)indexPath;
@end
