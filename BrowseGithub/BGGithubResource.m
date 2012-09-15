//
//  BGGithubResource.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//
//

#import "BGGithubResource.h"
#import "NSURL+GithubResource.h"
#import <AFNetworking/AFNetworking.h>

@interface BGGithubResource()
@property (nonatomic, strong) NSURL *resourceUrl;
@end

@implementation BGGithubResource

- (id)initWithPath:(NSString *)path auth:(BOOL)auth {
    self = [super init];
    if (self) {
        self.resourceUrl = [NSURL githubApiURLWithPath:path auth:auth];
    }
    return self;
}

- (id)initWithPath:(NSString *)path {
    return [self initWithPath:path auth:NO];
}

- (id)initWithAuthAndPath:(NSString *)path {
    return [self initWithPath:path auth:YES];
}

- (void)loadDataWithComplete:(void (^)(void))complete
                     failure:(void (^)(void))failure {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.resourceUrl];
    [request setValue:@"BrowseGithub (github => https://github.com/yaakaito , email => yaakaito@gmail.com , web => http://yaakaito.org)" forHTTPHeaderField:@"User-Agent"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                            [self setValuesFromJSON:JSON];
                                                                                            complete();
                                                                                        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                            NSDictionary *userInfo = @{ @"statusCode" : @(response.statusCode) };
                                                                                            [[NSNotificationCenter defaultCenter] postNotificationName:kBGGithubResourceRequestFailureNotification
                                                                                                                                                object:self
                                                                                                                                              userInfo:userInfo];
                                                                                            failure();
                                                                                        }];
    [operation start];
    
}

- (void)setValuesFromJSON:(id)json {
    ;
}
@end
