//
//  BGEvent.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/12.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGEvent : NSObject
@property (nonatomic, strong, readonly) NSString *typeString;
@property (nonatomic, strong, readonly) id payload;
@property (nonatomic, strong, readonly) NSString *actorLogin;
@property (nonatomic, strong, readonly) NSURL *actorGravatarUrl;
@property (nonatomic, strong, readonly) NSString *repositoryName;

- (id)initWithJSON:(id)json;
- (NSString*)message;
@end
