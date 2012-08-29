//
//  BGFeedEntry.m
//  BrowseGithub
//
//  Created by yaakaito on 12/08/28.
//
//

#import "BGFeedEntry.h"

@implementation BGFeedEntry

- (id)init {
    self = [super init];
    if(self) {
        self.type = kBGFeedEntryTypeUnknown;
    }
    return self;
}

- (BGFeedEntryType)type {
    if(_type != kBGFeedEntryTypeUnknown) {
        return _type;
    }
    
    if(!self.entryId) {
        return kBGFeedEntryTypeUnknown;
    }

    return kBGFeedEntryTypeUnknown;
}

- (void)setEntryId:(NSString *)entryId {
    _entryId = entryId;
    _type = kBGFeedEntryTypeUnknown;
}

@end
