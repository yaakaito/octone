//
//  BGPullRequestsController.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//
//

#import "BGPullRequestsController.h"
#import "BGPullRequestCell.h"

#import "BGDiscussionController.h"

@interface BGPullRequestsController ()

@end

@implementation BGPullRequestsController

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
    [self.tableView registerNib:[UINib nibWithNibName:@"BGPullRequestCell" bundle:nil] forCellReuseIdentifier:kBGPullRequestCellReuseIdentifier];
    
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

- (void)_updateCell:(BGPullRequestCell *)cell indexPath:(NSIndexPath *)indexPath {
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BGPullRequestCell *cell = [tableView dequeueReusableCellWithIdentifier:kBGPullRequestCellReuseIdentifier];
    if (!cell) {
        cell = [[BGPullRequestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBGPullRequestCellReuseIdentifier];
    }
    
    [self _updateCell:cell indexPath:indexPath];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BGDiscussionController *discussionController = [[BGDiscussionController alloc] init];
    
    [self assignBackBarButtonForTargetViewController:discussionController];
    [self.navigationController pushViewController:discussionController animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kBGPullRequestCellHeight;
}
@end
