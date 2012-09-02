//
//  BGAuthenticationwController.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/01.
//
//

#import "BGAuthenticationController.h"
#import "BGAuthenticationView.h"

@interface BGAuthenticationController ()

@end

@implementation BGAuthenticationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    
    self.view = [[BGAuthenticationView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidAppear:(BOOL)animated {

    [((BGAuthenticationView*)self.view) openOAuthWindowAnimation];
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

@end
