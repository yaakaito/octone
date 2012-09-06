//
//  BGNavigationController.m
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGNavigationController.h"
#import "UIColor+BrowseGithub.h"
#import "UIFont+BrowseGithub.h"
#import <QuartzCore/QuartzCore.h>

@interface BGNavigationController()

@end

@implementation BGNavigationController


- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        // Custom initialization
//        self.navigationBar.barStyle = UIBarStyleDefault;
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation-background"] forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.titleTextAttributes = @{ UITextAttributeTextColor : [UIColor githubTextColor]
        , UITextAttributeFont : [UIFont boldOpenSansFontOfSize:18]
        , UITextAttributeTextShadowColor : [UIColor githubHightlightColor]};
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - BGGlobalMenuViewControllerDelegate
- (void)globalMenuViewController:(id)sender didSelectNextViewController:(UIViewController *)viewController {
    
#warning wontfix
}
@end
