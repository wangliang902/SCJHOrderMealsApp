//
//  WLMineModel.h
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/12.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLMineModel : NSObject

@property (nonatomic,strong) NSMutableArray *mineArray;

+ (instancetype)sharaMineModel;
- (void)setUnlogin;
- (void)setLogin;

@end
