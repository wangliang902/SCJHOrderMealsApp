//
//  WLHomeContentView.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLHomeContentView.h"

@implementation WLHomeContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _isSeller = NO;
        
        _homeScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_homeScrollview];
        
        _homeHotView = [[WLHomeHotView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_homeScrollview addSubview:_homeHotView];
        
        _homeSellerView = [[WLHomeSellerView alloc] initWithFrame:CGRectMake(frame.size.width, 0, frame.size.width, frame.size.height)];
        [_homeScrollview addSubview:_homeSellerView];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
