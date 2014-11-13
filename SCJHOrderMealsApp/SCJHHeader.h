//
//  SCJHHeader.h
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/11.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#ifndef SCJHOrderMealsApp_SCJHHeader_h
#define SCJHOrderMealsApp_SCJHHeader_h


/**---------尺寸-----------*/

//设备屏尺寸
#define IOS_IPHONE_WINDOW_FRAME ([[UIScreen mainScreen] applicationFrame])
//设备宽度
#define IOS_IPHONE_WINDOW_WIDE (IOS_IPHONE_WINDOW_FRAME.size.width)
//x轴上中心值
#define IOS_IPHONE_WINDOW_CENTER_X (IOS_IPHONE_WINDOW_FRAME.size.width / 2)
//某个视图Y轴的中心值
#define IOS_IPHONE_VIEW_CENTER_Y(view) (view.frame.size.height / 2)


/**---------高度-----------*/

//设备高度
#define IOS_IPHONE_WINDOW_HIGH (IOS_IPHONE_WINDOW_FRAME.origin.y + IOS_IPHONE_WINDOW_FRAME.size.height)

//状态栏高度
#define IOS_IPHONE_STATUS_HIGH (20)

//导航栏高度
#define IOS_IPHONE_NAVIGATION_V_HIGH (44)               //纵向
#define IOS_IPHONE_NAVIGATION_H_HIGH (32)               //横向
#define IOS_IPHONE_NAVIGATION_BAR_IMAGE_HIGH (20)       //bar的图片高度

//视图的起点
#define IOS_IPHONE_ORIGIN_Y (IOS_IPHONE_STATUS_HIGH + IOS_IPHONE_NAVIGATION_V_HIGH)

//工具栏高度
#define IOS_IPHONE_TABBAR_HIGH (49)
#define IOS_IPHONE_TABBAR_IMAGE_HIGH (30)               //工具栏图片高度

/**----------SDK版本------------*/
//SDK版本
#define IOS_SDK ([[[UIDevice currentDevice] systemVersion] floatValue])

/**----------win------------*/
//获取window
#define IOS_IPHONE_WINDOW ([[UIApplication sharedApplication].delegate window])

/**----------该项目宏定义----------*/
#define ROOT_TITLE_WIDE (200) //中心标题的宽度

#define SET_USERDEFAULT(value,key)  ([[NSUserDefaults standardUserDefaults] setValue:value forKey:key])     //设置UserDefaults
#define GET_USERDEFAULT(key)        ([[NSUserDefaults standardUserDefaults] objectForKey:key])              //获取UserDefaults



#endif
