//
//  BGEvent.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGEvent.h"

@interface BGEvent()
@property (nonatomic, strong) NSString *typeString;
@property (nonatomic, strong) id payload;
@property (nonatomic, strong) NSString *actorLogin;
@property (nonatomic, strong) NSURL *actorGravatarUrl;
@property (nonatomic, strong) NSString *repositoryName;
@end

@implementation BGEvent

- (id)initWithJSON:(id)json {
    
    self = [super init];
    if (self) {
        self.typeString = [json objectForKey:@"type"];
        self.payload = [json objectForKey:@"payload"];
        self.actorLogin = [[json objectForKey:@"actor"] objectForKey:@"login"];
        self.actorGravatarUrl = [NSURL URLWithString:[[json objectForKey:@"actor"] objectForKey:@"avatar_url"]];
        self.repositoryName = [[json objectForKey:@"repo"] objectForKey:@"name"];
    }
    return self;
}

- (NSString *)message {
    return [NSString stringWithFormat:@"%@ : %@ %@ %@", self.typeString, self.actorLogin, [self.payload objectForKey:@"action"], self.repositoryName];
}

@end
