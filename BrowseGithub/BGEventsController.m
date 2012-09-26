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
#import "BGEvents.h"
#import "BGAuthenticationManager.h"
#import "BGEventMessageFormatter.h"
#import "BGEventCell.h"

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
  
    BGEvents *receivedEvents = [BGEvents receivedEventsWithUser:[[BGAuthenticationManager sharedManager] loginUser]];
    [self.manager reloadResource:receivedEvents
                        complete:^{
                            complete();
                        } failure:^{
                            complete();
                        }];
}

- (void)updateCell:(BGEventCell*)cell indexPath:(NSIndexPath*)indexPath {
    
    cell.event = [self.manager eventAtIndex:indexPath.row];
}


#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.manager numberOfEvents];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    BGEventCell *cell = [tableView dequeueReusableCellWithIdentifier:kBGEventCellReuseIdentifier];
    if (!cell) {
        cell = [[BGEventCell alloc] init];
    }
    
    [self updateCell:cell indexPath:indexPath];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kBGEventCellHeight;
}

@end
