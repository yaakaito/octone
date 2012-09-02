//
//  BGAuthenticationView.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/02.
//
//

#import "BGAuthenticationView.h"
#import "UIColor+BrowseGithub.h"
#import "UIGlossyButton+BrowseGithub.h"
#import <UIGlossyButton/UIGlossyButton.h>

#define kDefaultLogoFrame   CGRectMake(0,0,320,120);

@interface BGAuthenticationView()
@property (nonatomic, strong) UIImageView* slideLogoImageView;
@property (nonatomic, strong) UIGlossyButton *oauthStartButton;
@end

@implementation BGAuthenticationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor githubBackgroundColor];
        
        self.slideLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default-logo"]];
        [self addSubview:self.slideLogoImageView];
        
        self.oauthStartButton = [UIGlossyButton githubDefaultStyleButtonWithTitle:@"Github OAuth" color:[UIColor githubSecondaryColorB]];
        [self addSubview:self.oauthStartButton];
    
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.slideLogoImageView.frame = kDefaultLogoFrame;
    self.slideLogoImageView.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5 - 4.5);
    
    self.oauthStartButton.frame = CGRectMake(0, 0, 240, 44);
    self.oauthStartButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5 - 4.5);
    self.oauthStartButton.alpha = 0.0;
    
    
}

- (void)openOAuthWindowAnimation {
    
    [UIView animateWithDuration:0.8
                     animations:^{
                         self.slideLogoImageView.center = CGPointMake(self.frame.size.width *0.5, 100);
                         self.oauthStartButton.alpha = 1.0;
                     }];
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
