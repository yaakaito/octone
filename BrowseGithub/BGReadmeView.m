//
//  BGReadmeView.m
//  BrowseGithub
//
//  Created by yaakaito on 2013/02/11.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGReadmeView.h"

@interface BGReadmeView()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation BGReadmeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.webView = [[UIWebView alloc] initWithFrame:frame];
        self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
        
        self.webView.backgroundColor = [UIColor githubBackgroundColor];
        self.webView.opaque = NO;
        for(UIView *wview in [[[self.webView subviews] objectAtIndex:0] subviews]) {
            if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; }
        }
        
        [self addSubview:self.webView];
        
        NSMutableString *html = [[NSMutableString alloc] initWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"readme" ofType:@"html"]]
                                                             encoding:NSUTF8StringEncoding];
        [self.webView loadHTMLString:html baseURL:nil];
    }
    return self;
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
