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
    else if ([event.typeString isEqualToString:@"CreateEvent"]) {
        return [self createEventMessageWithEvent:event];
    }
    else if ([event.typeString isEqualToString:@"GistEvent"]) {
        return [self gistEventMessageWithEvent:event];
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

+ (NSAttributedString *)createEventMessageWithEvent:(BGEvent *)event {

    NSAttributedString *base;
    if([event.payload[@"ref_type"] isEqualToString:@"repository"]) {
        base = [[NSAttributedString alloc] initWithString:@" created repository "];
    }
    else {
        base = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" created %@ %@ at ", event.payload[@"ref_type"], event.payload[@"ref"]]];
    }
    NSMutableAttributedString *message = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedActor:event.actorLogin]];
    [message appendAttributedString:base];
    [message appendAttributedString:[self attributedRepository:event.repositoryName]];
    
    return message;    
}

+ (NSAttributedString *)gistEventMessageWithEvent:(BGEvent *)event {
    
    NSAttributedString *base = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@ gist: %@", event.payload[@"action"], event.payload[@"gist"][@"id"]]];
    NSMutableAttributedString *message = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedActor:event.actorLogin]];
    [message appendAttributedString:base];
    
    return message;
}

+ (NSString *)descriptionWithEvent:(BGEvent *)event {
    
    if ([event.typeString isEqualToString:@"CommitCommentEvent"]) {
        return event.payload[@"comment"][@"body"];
    }
    return nil;
}



@end
