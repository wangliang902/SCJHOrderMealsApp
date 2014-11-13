//
//  UIScrollView+WLRefresh.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/12.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "UIScrollView+WLRefresh.h"


@implementation UIScrollView (WLRefresh)

- (void)setHeaderView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, -30, 100, 30)];
    label.text = @"正在加载";
    [self addSubview:label];
}


@end
