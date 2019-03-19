//
//  FNSearchViewController.m
//  SearchNav
//
//  Created by mervin on 2019/3/19.
//  Copyright © 2019 mervin. All rights reserved.
//

#import "FNSearchViewController.h"
#import "FNSearchBar.h"

@interface FNSearchViewController ()<UISearchBarDelegate>

@property(nonatomic, strong) FNSearchBar *searchBar;
@property(nonatomic, strong) UIButton *cancelButton;
@property(nonatomic, strong) UIView *searchView;


@end

@implementation FNSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self loadSearchView];
    self.navigationItem.titleView = self.searchView;
}

- (void)loadSearchView
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 44;
    
    self.searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    self.searchBar = [[FNSearchBar alloc]initWithFrame:CGRectZero];
    self.searchBar.frame = CGRectMake(0, 0, width - 65, height);
    self.searchBar.delegate = self;
    [self.searchBar becomeFirstResponder];
    [self.searchView addSubview:self.searchBar];
    
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.searchBar.frame) - 3, CGRectGetMinY(self.searchBar.frame), 55, height)];
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
    [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self
                          action:@selector(cancelButtonClicked:)
                forControlEvents:UIControlEventTouchUpInside];
    [self.searchView addSubview:self.cancelButton];
}


- (void)cancelButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(onSearchCancelClick)]) {
        [self.delegate onSearchCancelClick];
    }
    [self.searchBar resignFirstResponder];
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"search: %@", searchText);

}



@end
