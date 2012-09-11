//
//  NLTHTTPStubServer+Specs.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/10.
//
//

#import "NLTHTTPStubServer+Specs.h"

@implementation NLTHTTPStubServer (Specs)

+ (id)sharedSpecServer {
    static dispatch_once_t pred = 0;
    __strong static NLTHTTPStubServer *_sharedServer = nil;
    dispatch_once(&pred, ^{
        _sharedServer = [self stubServer];
        [_sharedServer startServer];
    });
    return _sharedServer;
}
@end
