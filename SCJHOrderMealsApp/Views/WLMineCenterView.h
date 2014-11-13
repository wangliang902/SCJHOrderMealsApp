//
//  WLMineCenterView.h
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/11.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**------------------个人中心-页面-------------------------*/

typedef void(^MineCenterCallBack)(NSInteger index);//回调block

@interface WLMineCenterView : UIView

//选择时回调
- (void)selectMineView:(MineCenterCallBack)block;

@end
