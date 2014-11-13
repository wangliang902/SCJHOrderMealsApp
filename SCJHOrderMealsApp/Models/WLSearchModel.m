//
//  WLSearchModel.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/11.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLSearchModel.h"

#define USERDEFAULT_SEARCH_MODEL (@"userdefaultSearchModel")

static WLSearchModel *searchModel = nil;

@implementation WLSearchModel

+ (instancetype)shareSearchModel
{
    if (!searchModel)
    {
        searchModel = [[WLSearchModel alloc] init];
        if (GET_USERDEFAULT(USERDEFAULT_SEARCH_MODEL))
        {
            searchModel.vualeString = [[NSMutableString alloc] initWithString:GET_USERDEFAULT(USERDEFAULT_SEARCH_MODEL)];
        }else
        {
            searchModel.vualeString = [[NSMutableString alloc] init];
        }
    }
    return searchModel;
}

- (void)saveSearchModelInfo
{
    SET_USERDEFAULT(searchModel.vualeString, USERDEFAULT_SEARCH_MODEL);
}

@end
