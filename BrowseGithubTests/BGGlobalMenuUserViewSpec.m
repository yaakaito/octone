//
//  BrowseGithub - BGGlobalMenuUserViewSpec.m
//  Copyright 2012年 yaakaito. All rights reserved.
//
//  Created by: yaakaito
//

#import "Kiwi.h"
#import "BGGlobalMenuUserView.h"
#import "BGUser.h"

@interface BGGlobalMenuUserView()
@property (nonatomic, strong) UILabel *login;
@property (nonatomic, strong) UILabel *name;
@end

SPEC_BEGIN(BGGlobalMenuUserViewSpec)

describe(@"Global Menu User View", ^{
    BGGlobalMenuUserView *view = [[BGGlobalMenuUserView alloc] init];
    
    context(@"にユーザー情報をセットしたとき", ^{
        BGUser *user = [BGUser userWithLoginUser];
        beforeAll(^{
            user.login = @"yaakaito";
            user.name = @"KAZUMA Ukyo";
            view.user = user;
        });

        it(@"は、loginラベルにログイン名をセットする", ^{
            [view.login shouldNotBeNil];
            [[view.login.superview should] equal:view];
            [[view.login.text should] equal:@"yaakaito"];
        });
        
        it(@"は、nameラベルにユーザー名をセットする", ^{
            [view.name shouldNotBeNil];
            [[view.name.superview should] equal:view];
            [[view.name.text should] equal:@"KAZUMA Ukyo"];
        });
    });
});

SPEC_END
