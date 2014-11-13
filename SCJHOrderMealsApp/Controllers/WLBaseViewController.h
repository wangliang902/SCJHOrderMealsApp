//
//  WLBaseViewController.h
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/12.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

//views
#import "WLMineCenterView.h"
//views
#import "WLHiddenView.h"

@interface WLBaseViewController : UIViewController

@property(nonatomic,strong) WLMineCenterView *mineCenterView;

- (void)hiddenMineCenter;//隐藏个人中心页面

@end
