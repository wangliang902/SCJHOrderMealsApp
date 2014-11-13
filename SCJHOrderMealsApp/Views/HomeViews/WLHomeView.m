//
//  WLHomeView.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/12.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLHomeView.h"
#import "WLHomeCollectionViewCell.h"

#import "UIScrollview+WLRefresh.h"

//views
#import "WLHomeHeadView.h"

#define HOME_HEAD_HIGH (50)

@interface WLHomeView ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableArray *collectionArray;
    CGFloat cellWide;
}
@property(nonatomic,strong) UICollectionView *homeCollectionView;
@property(nonatomic,strong) NSMutableArray *buttonArray;

@property(nonatomic,strong) UIScrollView *homeScrollview;


@end

@implementation WLHomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        cellWide = IOS_IPHONE_WINDOW_WIDE / 4;
//        collectionArray = [@[@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31"] mutableCopy];
//        NSArray *titleArray = @[@"热门外卖",@"商家列表"];
//        for (int i = 0; i < titleArray.count; i ++)
//        {
//            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(IOS_IPHONE_WINDOW_WIDE / 2 * i, IOS_IPHONE_NAVIGATION_H_HIGH, IOS_IPHONE_WINDOW_WIDE / 2, HOME_HEAD_HIGH)];
//            [button setTitle:titleArray[i] forState:UIControlStateNormal];
//            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
//            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//            [self addSubview:button];
//            if (i == 0)
//            {
//                button.selected = YES;
//            }
//            [self.buttonArray addObject:button];
//        }
//        
//        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//        
//        _homeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, IOS_IPHONE_NAVIGATION_H_HIGH + HOME_HEAD_HIGH, frame.size.width, frame.size.height - HOME_HEAD_HIGH) collectionViewLayout:flowLayout];
//        _homeCollectionView.backgroundColor = [UIColor whiteColor];
//        [_homeCollectionView registerClass:[WLHomeCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
//        [self addSubview:_homeCollectionView];
//        _homeCollectionView.delegate = self;
//        _homeCollectionView.dataSource = self;
//        [_homeCollectionView reloadData];
//        
//        
//        [_homeCollectionView setHeaderView];
        
        WLHomeHeadView *homeHeadView = [[WLHomeHeadView alloc] initWithFrame:CGRectMake(0, IOS_IPHONE_NAVIGATION_H_HIGH, IOS_IPHONE_WINDOW_WIDE, HOME_HEAD_HIGH)];
        [self addSubview:homeHeadView];
        
        _homeContentView = [[WLHomeContentView alloc] initWithFrame:CGRectMake(0, IOS_IPHONE_NAVIGATION_H_HIGH + HOME_HEAD_HIGH, frame.size.width, frame.size.height - HOME_HEAD_HIGH)];
        [self addSubview:_homeContentView];
        
        [homeHeadView changeHeadView:^(NSInteger index) {
            if (index == 0)
            {
                [_homeContentView.homeScrollview setContentOffset:CGPointMake(0, 0) animated:YES];
                _homeContentView.isSeller = NO;
            }else if (index == 1)
            {
                _homeContentView.isSeller = YES;
                [_homeContentView.homeScrollview setContentOffset:CGPointMake(_homeContentView.homeScrollview.frame.size.width, 0) animated:YES];
            }
        }];
    
        
    }
    return self;
}

#pragma mark - 重新写属性的get方法

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray)
    {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}

#pragma mark - 设置head按键方法

- (void)buttonAction:(UIButton *)sender
{
    for (UIButton *button in _buttonArray)
    {
        if (sender == button)
        {
            button.selected = YES;
        }else
        {
            button.selected = NO;
        }
    }
    if ([sender.titleLabel.text isEqualToString:@"商家列表"])
    {
        collectionArray = [@[@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31",@"27",@"31"] mutableCopy];
    }else{
        
        collectionArray = [@[@"2s7",@"31d",@"2s7",@"31w",@"2e7",@"3sfa1"] mutableCopy];
    }

    [_homeCollectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return collectionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    WLHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell sizeToFit];
    cell.backgroundColor = [UIColor blueColor];
    if (cell)
    {
          [cell setContentView];
    }
  
    cell.label.text = collectionArray[indexPath.row];
    return cell;
}


//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {10,25,10,25};
    return top;
}

//设置顶部的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={0,0};
    return size;
}

//设置元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(cellWide,cellWide);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
