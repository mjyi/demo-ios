//
//  TableViewController.m
//  SearchNav
//
//  Created by mervin on 2019/3/18.
//  Copyright © 2019 mervin. All rights reserved.
//

#import "TableViewController.h"
#import "FNSearchViewController.h"
#import "FNSearchBar.h"


@interface TableViewController ()<UISearchBarDelegate, FNSearchViewDelegate>

@property(nonatomic, strong) NSArray *array;

@property(nonatomic, strong) FNSearchBar *searchBar;
@property(nonatomic, strong) UINavigationController *searchNavigationController;

@end

@implementation TableViewController

- (FNSearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[FNSearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 48)];
    }
    return _searchBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = @[@"apple", @"banana", @"lemon", @"pear", @"orange", @"cherry"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableHeaderView = self.searchBar;
    self.searchBar.delegate = self;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [UINavigationBar appearance].translucent = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.tabBarController.tabBar setHidden:YES];
    FNSearchViewController *searchController = [[FNSearchViewController alloc] init];
    self.searchNavigationController = [[UINavigationController alloc] initWithRootViewController:searchController];
    searchController.delegate = self;
    [self.navigationController.view addSubview:self.searchNavigationController.view];
    
}

- (void)onSearchCancelClick
{
    [self.searchNavigationController.view removeFromSuperview];
    [self.searchNavigationController removeFromParentViewController];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.tabBarController.tabBar setHidden:NO];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}


@end
