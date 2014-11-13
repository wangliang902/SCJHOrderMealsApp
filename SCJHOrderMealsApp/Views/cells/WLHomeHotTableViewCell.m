//
//  WLHomeHotTableViewCell.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLHomeHotTableViewCell.h"

@implementation WLHomeHotTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _sellerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [self addSubview:_sellerNameLabel];
        
        _mealNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_sellerNameLabel.frame.origin.x + _sellerNameLabel.frame.size.width, 0, 100, 100)];
        [self addSubview:_mealNameLabel];
        
        _mealPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_mealNameLabel.frame.origin.x + _mealNameLabel.frame.size.width, 0, 100, 100)];
        [self addSubview:_mealPriceLabel];

    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
