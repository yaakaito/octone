//
//  BGAuthenticationView.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/02.
//
//

#import "BGAuthenticationView.h"
#import "UIColor+BrowseGithub.h"

#define kDefaultLogoFrame   CGRectMake(0,0,320,120);

@interface BGAuthenticationView()
@property (nonatomic, strong) UIImageView* slideLogoImageView;
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
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.slideLogoImageView.frame = kDefaultLogoFrame;
    self.slideLogoImageView.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5 - 4.5);
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
