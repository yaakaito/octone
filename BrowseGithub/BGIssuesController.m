//
//  BGIssuesController.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//
//

#import "BGIssuesController.h"
#import "BGIssueCell.h"

#import "BGDiscussionController.h"

@interface BGIssuesController ()

@end

@implementation BGIssuesController

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
    [self.tableView registerNib:[UINib nibWithNibName:@"BGIssueCell" bundle:nil] forCellReuseIdentifier:kBGIssueCellReuseIdentifier];

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

- (void)_updateCell:(BGIssueCell *)cell indexPath:(NSIndexPath *)indexPath {
    
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
    
    BGIssueCell *cell = [tableView dequeueReusableCellWithIdentifier:kBGIssueCellReuseIdentifier];
    if (!cell) {
        cell = [[BGIssueCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBGIssueCellReuseIdentifier];
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
    return kBGIssueCellHeight;
}
@end
