//
//  BGGlobalMenuUserView.m
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGGlobalMenuUserView.h"

@interface BGGlobalMenuUserView()
@property (nonatomic, strong) UILabel *login;
@property (nonatomic, strong) UILabel *name;
@end

@implementation BGGlobalMenuUserView

- (id)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        
        self.login = [[UILabel alloc] init];
        [self addSubview:self.login];
        
        self.name = [[UILabel alloc] init];
        [self addSubview:self.name];
    }
    return self;
}

- (void)setUser:(BGUser *)user {
    if(_user != user) {
        _user = user;
        self.login.text = user.login;
        self.name.text = user.name;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
