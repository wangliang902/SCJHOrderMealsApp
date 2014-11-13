//
//  WLHiddenView.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/12.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLHiddenView.h"

static WLHiddenView *hiddeView = nil;

@implementation WLHiddenView

+ (instancetype)shareHiddenView
{
    if (!hiddeView)
    {
        hiddeView = [[WLHiddenView alloc] initWithFrame:CGRectMake(0, 0, IOS_IPHONE_WINDOW_WIDE, IOS_IPHONE_WINDOW_HIGH)];
    }
    return hiddeView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
