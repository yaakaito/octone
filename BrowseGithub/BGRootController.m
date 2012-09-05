//
//  BGRootController.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/01.
//
//

#import "BGRootController.h"

#import "BrowseGithub.h"

#import "BGAuthenticationController.h"
#import "BGNavigationController.h"
#import "BGGlobalMenuController.h"
#import "PatchedJASidePanelController.h"
#import "UIColor+BrowseGithub.h"

@interface BGRootController ()
@property (nonatomic, strong) BGAuthenticationController *authenticationController;
@property (nonatomic, strong) JASidePanelController *appRootController;
@end

@implementation BGRootController

- (CGRect)initialFrame {
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    return frame;
}

- (BGAuthenticationController *)authenticationController {
    if(_authenticationController) {
        return _authenticationController;
    }
    
    _authenticationController = [[BGAuthenticationController alloc] init];
    _authenticationController.view.frame = [self initialFrame];
    
    return _authenticationController;
}

- (JASidePanelController *)appRootController {
    if(_appRootController) {
        return _appRootController;
    }
    
    _appRootController = [[PatchedJASidePanelController alloc] init];
    _appRootController.view.frame = [self initialFrame];
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor githubBackgroundColor];
    vc.title = @"News Feeds";
    BGGlobalMenuController *globalMenuController = [[BGGlobalMenuController alloc] init];
    BGNavigationController *navigationController = [[BGNavigationController alloc] initWithRootViewController:vc];
    globalMenuController.delegate = navigationController;
    _appRootController.centerPanel = navigationController;
    _appRootController.leftPanel = globalMenuController;
    
    return _appRootController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    // Do any additional setup after loading the view.
//    [self addChildViewController:self.authenticationController];
    


    if(![BrowseGithub authenticated]) {
        [self addChildViewController:self.authenticationController];
        [self.view addSubview:self.authenticationController.view];
    }
    else {
        [self addChildViewController:self.appRootController];
        [self.view addSubview:self.appRootController.view];
    }

}

- (void)viewWillAppear:(BOOL)animated {
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

@end
