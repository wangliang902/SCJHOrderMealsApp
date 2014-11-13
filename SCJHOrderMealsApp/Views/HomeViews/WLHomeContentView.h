//
//  WLHomeContentView.h
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WLHomeHotView.h"
#import "WLHomeSellerView.h"

@interface WLHomeContentView : UIView

@property(nonatomic,strong) WLHomeHotView *homeHotView;

@property(nonatomic,strong) WLHomeSellerView *homeSellerView;

@property(nonatomic,strong) UIScrollView *homeScrollview;

@property(nonatomic,assign) BOOL isSeller;

@end
