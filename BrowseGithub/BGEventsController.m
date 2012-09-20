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
#import "BGReceivedEvents.h"
#import "BGAuthenticationManager.h"

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

- (void)reloadData:(void (^)(void))complete {
  
    BGReceivedEvents *receivedEvents = [BGReceivedEvents receivedEventsWithUser:[[BGAuthenticationManager sharedManager] loginUser]];
    [self.manager reloadResource:receivedEvents
                        complete:^{
                            complete();
                        } failure:^{
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
