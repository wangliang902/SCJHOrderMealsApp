//
//  HomeHeadView.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/13.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLHomeHeadView.h"

@interface WLHomeHeadView ()

@property(nonatomic,strong) NSMutableArray *buttonArray;
@property(nonatomic,strong) UIButton *lastButton;

@end

@implementation WLHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *titleArray = @[@"热门外卖",@"商家列表"];
        for (int i = 0; i < titleArray.count; i ++)
        {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width / 2 * i, 0, frame.size.width / 2, frame.size.height)];
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            if (i == 0)
            {
                button.selected = YES;
                _lastButton = button;
            }
            [self.buttonArray addObject:button];
        }
    }
    return self;
}

#pragma mark - 重新写属性的get方法

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray)
    {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}

#pragma mark - 设置head按键方法

- (void)buttonAction:(UIButton *)sender
{
    if (_lastButton != sender)
    {
        for (UIButton *button in _buttonArray)
        {
            if (sender == button)
            {
                button.selected = YES;
            }else
            {
                button.selected = NO;
            }
        }
        _lastButton = sender;
        _block([_buttonArray indexOfObject:sender]);
    }
}


- (void)changeHeadView:(ChangeHeadBlock)block
{
    _block = block;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
