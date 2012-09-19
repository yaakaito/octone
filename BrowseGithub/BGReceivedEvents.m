//
//  BGReceivedEvents.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGReceivedEvents.h"
#import "BGUser.h"
#import "BGEvent.h"
#import "NSURL+GithubResource.h"

@interface BGReceivedEvents()
@property (nonatomic, strong) NSArray *events;
@end

@implementation BGReceivedEvents

+ (id)receivedEventsWithUser:(BGUser *)user {
    return [[self alloc] initWithUrl:[NSURL githubApiURLWithPath:[NSString stringWithFormat:@"/users/%@/received_events", user.login]
                                                            auth:YES]];
}

- (void)setValuesFromJSON:(id)json {
    
    if(![json isKindOfClass:[NSArray class]]) {
        return;
    }
    
    NSArray *jsonArray = json;
    NSMutableArray *events = [NSMutableArray arrayWithCapacity:30];
    for (id eventJson in jsonArray) {
        BGEvent *event = [[BGEvent alloc] initWithJSON:eventJson];
        [events addObject:event];
    }
    self.events = events;

}
@end
