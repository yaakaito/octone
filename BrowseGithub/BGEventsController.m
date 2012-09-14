//
//  BGEventsController.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//
//

#import "BGEventsController.h"
#import "BGEvent.h"
#import "BGEventManager.h"
#import "BGBaseCell.h"

@interface BGEventsController ()
@property (nonatomic, strong) BGEventManager *manager;
@end

@implementation BGEventsController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        self.manager = [[BGEventManager alloc] init];
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

- (void)reloadData:(void (^)(void))complete {
  
    [self.manager prepareLoginUserReceivedEvents];
    [self.manager reloadCurrentResource:^(BOOL success) {
        complete();
    }];
}


#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.manager numberOfEvents];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BGBaseCell *cell = [[BGBaseCell alloc] init];
    BGEvent *event = [self.manager eventAtIndex:indexPath.row];
    cell.textLabel.text = [event message];
    return cell;
}

@end
