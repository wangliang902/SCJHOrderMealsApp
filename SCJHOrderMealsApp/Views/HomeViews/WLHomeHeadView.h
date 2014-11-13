//
//  HomeHeadView.h
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangeHeadBlock)(NSInteger index);

@interface WLHomeHeadView : UIView

{
    ChangeHeadBlock _block;
}

- (void)changeHeadView:(ChangeHeadBlock)block;

@end
