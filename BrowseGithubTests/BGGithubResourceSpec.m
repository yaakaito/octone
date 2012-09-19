//
//  BrowseGithub - BGGithubResourceSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <Kiwi/Kiwi.h>
#import <NLTHTTPStubServer/NLTHTTPStubServer.h>
#import "NLTHTTPStubServer+Specs.h"
#import "BGGithubResource.h"
#import "BGAuthenticationManager.h"
#import "FakeNotificationReceiver.h"
#import "AsyncSupporter.h"

@interface BGGithubResource(Specs)
@property (nonatomic, strong) NSURL *resourceUrl;
@end


SPEC_BEGIN(BGGithubResourceSpec)

describe(@"Github Resource", ^{
    __block BGGithubResource *githubResource;
    __block NSString *accessToken;
    
    beforeAll(^{
        accessToken = [[BGAuthenticationManager sharedManager] accessToken];
    });
    
    context(@"を初期化するとき", ^{
        
        it(@"は、URLを引数に取ってURLをセットする", ^{
            NSURL *url = [NSURL URLWithString:@"https://api.github.com/user"];
            githubResource = [[BGGithubResource alloc] initWithUrl:url];
            [[[githubResource.resourceUrl absoluteString] should] equal:[url absoluteString]];
        });
    });
    
    context(@"がAPIにリクエストを行ったとき", ^{
        __block NLTHTTPStubServer *server;
        __block AsyncSupporter *asyncSupporter;
        
        beforeAll(^{
            server = [NLTHTTPStubServer sharedSpecServer];
            asyncSupporter = [[AsyncSupporter alloc] init];
        });
        
        beforeEach(^{
            [asyncSupporter prepare];
        });
        
        it(@"は、自身のresourceUrlに対してリクエストを行う", ^{
            [[[server stub] forPath:@"/stub"] andJSONResponseResource:@"resource" ofType:@"json"];
            githubResource = [[BGGithubResource alloc] initWithUrl:[NSURL URLWithString:@"http://localhost:12345/stub"]];
            [githubResource loadDataWithComplete:^{
                [asyncSupporter notify:kAsyncSupporterWaitStatusSuccess];
            } failure:^{
                [asyncSupporter notify:kAsyncSupporterWaitStatusFailure];
            }];
            [asyncSupporter waitForTimeout:3.0f];
            [[theValue([server isStubEmpty]) should] beYes];
            [server clear];
        });
        
        context(@"リクエストに成功したら", ^{
            beforeEach(^{
                [[[server stub] forPath:@"/stub"] andJSONResponseResource:@"resource" ofType:@"json"];
                githubResource = [[BGGithubResource alloc] initWithUrl:[NSURL URLWithString:@"http://localhost:12345/stub"]];
            });
            
            it(@"それは、結果をパースするために、自身のsetValuesFromJSON:を呼び出す", ^{
                [[githubResource should] receive:@selector(setValuesFromJSON:) withCount:1];
                [githubResource loadDataWithComplete:^{
                    [asyncSupporter notify:kAsyncSupporterWaitStatusSuccess];
                } failure:^{
                    [asyncSupporter notify:kAsyncSupporterWaitStatusFailure];
                }];
                [asyncSupporter waitForTimeout:3.0f];
            });
            
            it(@"それは、コールバックブロックを呼び出す", ^{
                __block BOOL callbacked = NO;
                [githubResource loadDataWithComplete:^{
                    callbacked = YES;
                    [asyncSupporter notify:kAsyncSupporterWaitStatusSuccess];
                } failure:^{
                    [asyncSupporter notify:kAsyncSupporterWaitStatusFailure];
                }];
                [asyncSupporter waitForTimeout:3.0f];
                [[theValue(callbacked) should] beYes];
            });
            
            afterEach(^{
                [[theValue([server isStubEmpty]) should] beYes];
                [server clear];
            });
        });
        
        context(@"リクエストに失敗したら", ^{
            beforeEach(^{
                [[[[server stub] forPath:@"/stub"] andJSONResponseResource:@"resource" ofType:@"json"] andStatusCode:404];
                githubResource = [[BGGithubResource alloc] initWithUrl:[NSURL URLWithString:@"http://localhost:12345/stub"]];
            });
            
            
            it(@"それは、失敗用のコールバックブロックを呼び出す", ^{
                __block BOOL callbacked = NO;
                [githubResource loadDataWithComplete:^{
                    [asyncSupporter notify:kAsyncSupporterWaitStatusFailure];
                } failure:^{
                    callbacked = YES;
                    [asyncSupporter notify:kAsyncSupporterWaitStatusSuccess];
                }];
                [asyncSupporter waitForTimeout:3.0f];
                [[theValue(callbacked) should] beYes];
            });
            
            it(@"それは、リクエストに失敗したことを示すNofiticationを発行する", ^{
                FakeNotificationReceiver *receiver = [FakeNotificationReceiver receiver];
                [receiver addReceiveNotification:kBGGithubResourceRequestFailureNotification];
                [githubResource loadDataWithComplete:^{
                    [asyncSupporter notify:kAsyncSupporterWaitStatusFailure];
                } failure:^{
                    [asyncSupporter notify:kAsyncSupporterWaitStatusSuccess];
                }];
                [asyncSupporter waitForTimeout:3.0f];
                [[theValue([receiver didReceivedNotification:kBGGithubResourceRequestFailureNotification]) should] beYes];
                NSDictionary *userInfo = [receiver userInfoForRecivedNotification:kBGGithubResourceRequestFailureNotification];
                NSInteger statusCode = [[userInfo objectForKey:@"statusCode"] integerValue];
                [[theValue(statusCode) should] equal:theValue(404)];
            });
            
            afterEach(^{
                [[theValue([server isStubEmpty]) should] beYes];
                [server clear];
            });
        });
        
        afterAll(^{
            [server clear];
        });
    });

});

SPEC_END
