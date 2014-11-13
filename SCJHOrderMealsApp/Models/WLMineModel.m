//
//  WLMineModel.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/12.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLMineModel.h"

static WLMineModel* mineModel = nil;

@implementation WLMineModel

+ (instancetype)sharaMineModel
{
    if (!mineModel)
    {
        mineModel = [[WLMineModel alloc] init];
    }
    return mineModel;
}

- (void)setUnlogin
{
    mineModel.mineArray = [@[@"登录",@"周边的外卖",@"我的订单",@"我收藏的店铺",@"关于"] mutableCopy];
}

- (void)setLogin
{
    mineModel.mineArray = [@[@"账号",@"周边的外卖",@"我的订单",@"我收藏的店铺",@"关于",@"退出"] mutableCopy];
}

@end
