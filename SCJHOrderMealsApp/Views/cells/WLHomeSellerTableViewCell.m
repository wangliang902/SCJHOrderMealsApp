//
//  WLHomeSellerTableViewCell.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLHomeSellerTableViewCell.h"

@implementation WLHomeSellerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _sellerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        [self addSubview:_sellerNameLabel];
        
        _sellerInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, 50)];
        [self addSubview:_sellerInfoLabel];
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
