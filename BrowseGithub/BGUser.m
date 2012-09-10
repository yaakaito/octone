//
//  BGUser.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/10.
//
//

#import "BGUser.h"

@implementation BGUser

- (id)initWithUserName:(NSString *)userName {
    
    self = [super initWithPath:[NSString stringWithFormat:@"/users/%@", userName]];
    if (self) {
        
    }
    
    return self;
}

- (id)initWithLoginUser {
    
    self = [super initWithAuthAndPath:@"/user"];
    if (self) {
        
    }
    
    return self;
}
@end
