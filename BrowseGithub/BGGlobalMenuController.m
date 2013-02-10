//
//  BGGlobalMenuController.m
//  BrowseGithub
//
//  Created by KAZUMA Ukyo on 12/08/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BGGlobalMenuController.h"
#import "BGGlobalMenuContentCell.h"
#import "UIColor+BrowseGithub.h"
#import "BGGlobalMenuContext.h"

@interface BGGlobalMenuController ()
@property (nonatomic, weak) BGGlobalMenuContext *contents;
@end

@implementation BGGlobalMenuController

- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        self.contents = [BGGlobalMenuContext sharedContents];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.backgroundColor = [UIColor githubGlobalMenuBackgroundColor];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu-background"]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.contents numberOfContents];
}

- (void)_updateCell:(BGGlobalMenuContentCell *)cell indexPath:(NSIndexPath *)indexPath
{
    BGMenuContents *contents = [self.contents contentsForIndex:indexPath.row];
    cell.menuContents = contents;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = kGlobalMenuContentCellReuseIdentifier;
    BGGlobalMenuContentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell) {
        UINib *nib = [UINib nibWithNibName:@"BGGlobalMenuContentCell" bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
    }
    
    // Configure the cell...
    [self _updateCell:cell indexPath:indexPath];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(self.delegate && [self.delegate respondsToSelector:@selector(globalMenuController:didSelectNextViewController:)])
    {
        [self.delegate globalMenuController:self didSelectNextViewController:[self.contents contentsControllerForIndex:indexPath.row]];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
