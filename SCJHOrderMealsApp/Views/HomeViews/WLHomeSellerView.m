//
//  WLHomeSellerView.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLHomeSellerView.h"
#import "WLHomeSellerTableViewCell.h"

@interface WLHomeSellerView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *sellerTableView;

@end

@implementation WLHomeSellerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _sellerTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _sellerTableView.delegate = self;
        _sellerTableView.dataSource = self;
        _sellerTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_sellerTableView];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    WLHomeSellerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[WLHomeSellerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.sellerNameLabel.text = @"餐馆1";
    cell.sellerInfoLabel.text = @"商家简绍";
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _block();
}

- (void)selectTheCell:(SellerBlock)block
{
    _block = block;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
