//
//  WLSearchModel.h
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/11.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLSearchModel : NSObject

@property(nonatomic,strong) NSMutableString *vualeString;

+(instancetype) shareSearchModel;
-(void) saveSearchModelInfo;//本地存储信息

@end
