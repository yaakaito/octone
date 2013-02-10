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
#import "BGEventsController.h"
#import "BGGithubResource.h"
#import "BGGlobalMenuContext.h"

#import <EEHUDView/EEHUDView.h>

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
    [(PatchedJASidePanelController*)_appRootController startNotificationListener];

    UIViewController *firstController = [[BGGlobalMenuContext sharedContents] contentsControllerForIndex:0];
    BGGlobalMenuController *globalMenuController = [[BGGlobalMenuController alloc] init];
    BGNavigationController *navigationController = [[BGNavigationController alloc] initWithRootViewController:firstController];
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
    
    if(![BrowseGithub authenticated]) {
        [self addChildViewController:self.authenticationController];
        [self.view addSubview:self.authenticationController.view];
    }
    else {
        [self addChildViewController:self.appRootController];
        [self.view addSubview:self.appRootController.view];
    }

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(githubResourceDidRequestFailure:)
                                                 name:kBGGithubResourceRequestFailureNotification
                                               object:nil];
}

- (void)showNetworkError
{
    [EEHUDView growlWithMessage:@"Network Error"
                      showStyle:EEHUDViewShowStyleShake
                      hideStyle:EEHUDViewHideStyleFadeOut
                resultViewStyle:EEHUDResultViewStyleNG
                       showTime:0.6f];
}

- (void)githubResourceDidRequestFailure:(NSNotification *)notification
{
    [self showNetworkError];
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
