//
//  WLHomeCollectionViewCell.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/12.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLHomeCollectionViewCell.h"

@implementation WLHomeCollectionViewCell

- (void)setContentView
{
    if (!_label)
    {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self.contentView addSubview:_label];
    }
}

@end
