//
//  WLHomeHotView.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLHomeHotView.h"
#import "WLHomeHotTableViewCell.h"

@interface WLHomeHotView () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *hotTableView;

@end

@implementation WLHomeHotView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _hotTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _hotTableView.delegate = self;
        _hotTableView.dataSource = self;
        _hotTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_hotTableView];
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
    return  100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    WLHomeHotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[WLHomeHotTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.sellerNameLabel.text = @"(大院点)";
    cell.mealNameLabel.text = @"小炒肉";
    cell.mealPriceLabel.text = @"20元";
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
