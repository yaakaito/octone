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

- (id)initWithUrl:(NSURL*)url {
    self = [super init];
    if (self) {
        self.resourceUrl = url;
    }
    return self;
}

- (void)loadDataWithComplete:(void (^)(void))complete
                     failure:(void (^)(void))failure {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.resourceUrl];
    [request setValue:@"BrowseGithub (github => https://github.com/yaakaito/browsegithub , email => yaakaito@gmail.com , web => http://yaakaito.org)" forHTTPHeaderField:@"User-Agent"];
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
