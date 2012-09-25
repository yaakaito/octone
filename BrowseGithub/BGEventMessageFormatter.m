//
//  BGEventMessageFormatter.m
//  BrowseGithub
//
//  Created by yaakaito on 2012/09/25.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGEventMessageFormatter.h"
#import "BGEvent.h"
#import "UIColor+BrowseGithub.h"

@implementation BGEventMessageFormatter

+ (NSAttributedString *)messageWithEvent:(BGEvent *)event {
    
    if ([event.typeString isEqualToString:@"CommitCommentEvent"]) {
        return [self commitCommentEventMessageWithEvent:event];
    }
    return nil;
}

+ (NSAttributedString *)attributedActor:(NSString *)actor {
    
    return [[NSAttributedString alloc] initWithString:actor attributes:@{NSForegroundColorAttributeName : [UIColor githubPrimaryColor]}];
}

+ (NSAttributedString *)attributedRepository:(NSString*)repository {
    
    return [[NSAttributedString alloc] initWithString:repository attributes:@{NSForegroundColorAttributeName : [UIColor githubPrimaryColor]}];
}

+ (NSAttributedString *)commitCommentEventMessageWithEvent:(BGEvent *)event {
    
    NSString *shortHash = [event.payload[@"comment"][@"commit_id"] substringToIndex:9];
    NSAttributedString *attributedHash = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"@%@", shortHash]];
    NSAttributedString *base = [[NSAttributedString alloc] initWithString:@" commented on commit "];
    NSMutableAttributedString *message = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedActor:event.actorLogin]];
    [message appendAttributedString:base];
    [message appendAttributedString:[self attributedRepository:event.repositoryName]];
    [message appendAttributedString:attributedHash];
    
    return message;
}

+ (NSString *)descriptionWithEvent:(BGEvent *)event {
    
    if ([event.typeString isEqualToString:@"CommitCommentEvent"]) {
        return event.payload[@"comment"][@"body"];
    }
    return nil;
}



@end
