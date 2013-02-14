//
//  BGHTMLRenderingController.m
//  octone
//
//  Created by yaakaito on 2013/02/15.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGHTMLRenderingController.h"

@interface BGHTMLRenderingController ()
@property (nonatomic, strong) UIWebView *_webView;
@end

@implementation BGHTMLRenderingController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self._webView = [self.class webView];
    [self.view addSubview:self._webView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self._webView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UIWebView *)webView
{
    return nil;
}
@end
