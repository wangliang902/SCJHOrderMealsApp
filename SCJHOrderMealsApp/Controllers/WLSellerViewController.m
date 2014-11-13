//
//  WLSellerViewController.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLSellerViewController.h"

#import "WLSellerTableViewCell.h"

#define ORIGIN_X (20)
#define CELL_HEAD_HIGH (50)

@interface WLSellerViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UILabel *sellerInfoLabel;
@property(nonatomic,strong)UITableView *sellTableView;


@end

@implementation WLSellerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"商家";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setShowView];
}

#pragma mark - 设置显示视图

- (void)setShowView
{
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(ORIGIN_X, IOS_IPHONE_ORIGIN_Y, 100, 30)];
    label1.text = @"商家介绍:";
    [self.view addSubview:label1];
    
    _sellerInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(ORIGIN_X, label1.frame.origin.y + label1.frame.size.height, IOS_IPHONE_WINDOW_WIDE - 2 * ORIGIN_X, 50)];
    _sellerInfoLabel.text = @"说法是福建按双方就快来撒解放路撒减肥了手机发手机福利时间";
    _sellerInfoLabel.numberOfLines = 0;
    [self.view addSubview:_sellerInfoLabel];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(ORIGIN_X, _sellerInfoLabel.frame.origin.y + _sellerInfoLabel.frame.size.height, IOS_IPHONE_WINDOW_WIDE - 2 * ORIGIN_X, 50)];
    label2.text = @"提供的外卖信息如下:";
    [self.view addSubview:label2];
    
    _sellTableView = [[UITableView alloc] initWithFrame:CGRectMake(ORIGIN_X, label2.frame.origin.y + label2.frame.size.height, IOS_IPHONE_WINDOW_WIDE - 2 * ORIGIN_X, IOS_IPHONE_WINDOW_HIGH - (label2.frame.origin.y + label2.frame.size.height)) style:UITableViewStylePlain];
    _sellTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _sellTableView.delegate = self;
    _sellTableView.dataSource = self;
    [self.view addSubview:_sellTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CELL";
    WLSellerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[WLSellerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.mealNameLabel.text = @"小炒肉";
    cell.mealPriceLabel.text = @"20元";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CELL_HEAD_HIGH;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, CELL_HEAD_HIGH)];
    view.backgroundColor = [UIColor redColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    label.text = @"荤菜（4）";
    [view addSubview:label];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
