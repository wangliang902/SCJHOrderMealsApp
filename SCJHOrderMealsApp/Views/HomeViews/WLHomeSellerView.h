//
//  WLHomeSellerView.h
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SellerBlock)();

@interface WLHomeSellerView : UIView
{
    SellerBlock _block;
}

- (void)selectTheCell:(SellerBlock)block;

@end
