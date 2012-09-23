//
//  BGRepositoriesController.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/06.
//
//

#import "BGRepositoriesController.h"
#import "BGRepositoryManager.h"
#import "BGRepositories.h"
#import "BGRepository.h"
#import "BGBaseCell.h"
#import "BGRepositoryController.h"
#import "UIViewController+BrowseGithub.h"

@interface BGRepositoriesController ()
@property (nonatomic, strong) BGRepositoryManager *manager;
@end

@implementation BGRepositoriesController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.manager = [[BGRepositoryManager alloc] init];
    }
    return self;
}

- (void)reloadData:(void (^)(void))complete {

    BGRepositories *repositories = [BGRepositories repositoriesWithLoginUserPerPage:20 forPage:1];
    [self.manager reloadResource:repositories
                        complete:^{
                            complete();
                        } failure:^{
                            complete();
                        }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.manager numberOfRepositories];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BGBaseCell *cell = [[BGBaseCell alloc] init];
    BGRepository *repository = [self.manager repositoryAtIndex:indexPath.row];
    cell.textLabel.text = repository.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back-button"]]];
//    UIBarButtonItem *backBarButtonItem =
//    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-button"]
//                                     style:UIBarButtonItemStyleBordered
//                                    target:nil
//                                    action:nil];
//    [backBarButtonItem setBackgroundImage:[UIImage imageNamed:@"back-button"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//
    BGRepositoryController *repositoryController = [[BGRepositoryController alloc] initWithRepository:[self.manager repositoryAtIndex:indexPath.row]];
    
    [self assignBackBarButtonForTargetViewController:repositoryController];
    [self.navigationController pushViewController:repositoryController animated:YES];
    

}

@end
