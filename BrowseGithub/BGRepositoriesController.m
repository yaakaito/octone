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
#import "BGRepositoryCell.h"
#import "BGRepositoryController.h"
#import "BGPageLoadingCell.h"
#import "BGAuthenticationManager.h"

@interface BGRepositoriesController ()
@property (nonatomic, strong) BGRepositoryManager *manager;
@property (nonatomic) NSUInteger currentPage;
@property (nonatomic) NSUInteger maximumPage;
@property (nonatomic) BOOL loadingNextPage;
@end

@implementation BGRepositoriesController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.manager = [[BGRepositoryManager alloc] init];
        self.maximumPage = [[BGAuthenticationManager sharedManager] loginUser].publicRepos / 20 + 1;
    }
    return self;
}

- (void)reloadData:(void (^)(void))complete {

    self.currentPage = 1;
    BGRepositories *repositories = [BGRepositories repositoriesWithLoginUserPerPage:20 forPage:1];
    [self.manager reloadResource:repositories
                        complete:^{
                            complete();
                        } failure:^{
                            complete();
                        }];
}

- (void)loadNextPage {
    
    self.loadingNextPage = YES;
    BGRepositories *repositories = [BGRepositories repositoriesWithLoginUserPerPage:20 forPage:++self.currentPage];
    [self.manager addResource:repositories
                     complete:^{
                         self.loadingNextPage = NO;
                         [self.tableView reloadData];
                     } failure:^{
                         self.loadingNextPage = NO;
                     }];
}

- (void)updateCell:(BGRepositoryCell*)cell indexPath:(NSIndexPath*)indexPath {
    
    cell.repository = [self.manager repositoryAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BGRepositoryCell" bundle:nil] forCellReuseIdentifier:kBGRepositoryCellReuseIdentifier];
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.manager numberOfRepositories] + ( [self.manager numberOfRepositories] > 0 ? 1 : 0 );
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < [self.manager numberOfRepositories]) {
        BGRepositoryCell *cell = [tableView dequeueReusableCellWithIdentifier:kBGRepositoryCellReuseIdentifier];
        if (!cell) {
            cell = [[BGRepositoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBGRepositoryCellReuseIdentifier];
        }
        
        [self updateCell:cell indexPath:indexPath];
        
        return cell;
    }
    else {
        BGPageLoadingCell *cell = [tableView dequeueReusableCellWithIdentifier:kBGPageLoadingCellReuseIdentifier];
        if (!cell) {
            cell = [[BGPageLoadingCell alloc] init];
        }
        
        if (self.currentPage != self.maximumPage) {
            [cell startIndicator];
            if (!self.loadingNextPage) {
                [self loadNextPage];
            }
        }
        else {
            [cell showComplete];
        }
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BGRepositoryController *repositoryController = [[BGRepositoryController alloc] init];//[[BGRepositoryController alloc] initWithRepository:[self.manager repositoryAtIndex:indexPath.row]];
    
    [self assignBackBarButtonForTargetViewController:repositoryController];
    [self.navigationController pushViewController:repositoryController animated:YES];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kBGRepositoryCellHeight;
}

@end
