//
//  ViewController.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/11.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLRootViewController.h"

//views
#import "WLHomeView.h"

//viewControllers
#import "WLSearchViewController.h"
#import "WLAboutViewController.h"
#import "WLSellerViewController.h"

@interface WLRootViewController ()
{
    CGFloat moveX;
}

@property(nonatomic,strong) UIView *alphaView;
@property(nonatomic,strong) WLHomeView *homeView;
@end

@implementation WLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNavigationBarMethod];
    
    _homeView = [[WLHomeView alloc] initWithFrame:CGRectMake(0, IOS_IPHONE_NAVIGATION_H_HIGH, IOS_IPHONE_WINDOW_WIDE, IOS_IPHONE_WINDOW_HIGH - IOS_IPHONE_NAVIGATION_H_HIGH)];
    [_homeView.homeContentView.homeSellerView selectTheCell:^{
        [self.navigationController pushViewController:[[WLSellerViewController alloc] init] animated:YES];
    }];
    [self.view addSubview:_homeView];
}

#pragma mark - 设置navigationBar方法

- (void)setNavigationBarMethod
{
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, IOS_IPHONE_NAVIGATION_BAR_IMAGE_HIGH, IOS_IPHONE_NAVIGATION_BAR_IMAGE_HIGH)];
    rightButton.backgroundColor = [UIColor redColor];
    [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    UIButton *centerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ROOT_TITLE_WIDE,IOS_IPHONE_NAVIGATION_BAR_IMAGE_HIGH * 2)];
    centerButton.backgroundColor = [UIColor blueColor];
    [centerButton setTitle:@"88学校" forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(centerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = centerButton;
    
    [self.mineCenterView selectMineView:^(NSInteger index) {
        [self hiddenMineCenter];
        [self.navigationController pushViewController:[[WLAboutViewController alloc] init] animated:NO];
    }];
}

#pragma mark - 右边查找按键方法

- (void)rightButtonAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[[WLSearchViewController alloc] init] animated:YES];
}

#pragma mark - 中间选择学校商家按键的方法

- (void)centerButtonAction:(UIButton *)sender
{
    [sender setTitle:@"点击了" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (_homeView.homeContentView.isSeller)
    {
        [_homeView.homeContentView.homeScrollview setContentOffset:CGPointMake(_homeView.homeContentView.homeScrollview.frame.size.width, 0) animated:NO];
    }else
    {
        [_homeView.homeContentView.homeScrollview setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    
}

@end
