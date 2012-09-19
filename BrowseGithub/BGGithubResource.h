//
//  BGGithubResource.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//
//

#import <Foundation/Foundation.h>

#define kBGGithubResourceRequestFailureNotification  (@"BGGithubResourceRequestFailureNotification")

@interface BGGithubResource : NSObject
@property (nonatomic, strong, readonly) NSURL *resourceUrl;
- (id)initWithUrl:(NSURL *)url;
- (id)initWithUrl:(NSURL *)url JSON:(id)json;
- (void)loadDataWithComplete:(void (^)(void))complete
                     failure:(void (^)(void))failure;
- (void)setValuesFromJSON:(id)json;
@end
