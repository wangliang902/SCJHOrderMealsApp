//
//  WLBaseViewController.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/12.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLBaseViewController.h"\



@interface WLBaseViewController ()
{
    CGFloat moveX;
}
@property(nonatomic,strong) UIView *alphaView;

@end

@implementation WLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, IOS_IPHONE_NAVIGATION_BAR_IMAGE_HIGH, IOS_IPHONE_NAVIGATION_BAR_IMAGE_HIGH)];
    leftButton.backgroundColor = [UIColor redColor];
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    moveX = IOS_IPHONE_WINDOW_FRAME.size.width / 5 * 4;
   
    if (!self.mineCenterView)
    {
        self.mineCenterView = [[WLMineCenterView alloc] initWithFrame:CGRectMake(-moveX, 0, moveX, IOS_IPHONE_WINDOW_HIGH)];
        [IOS_IPHONE_WINDOW addSubview:self.mineCenterView];
    }
    
    _alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IOS_IPHONE_WINDOW_WIDE, IOS_IPHONE_WINDOW_HIGH)];
    _alphaView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];//为啥 alpha = 0，会出现bug
    [self.navigationController.view addSubview:_alphaView];
    _alphaView.hidden = YES;
    _alphaView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenTheView:)];
    [_alphaView addGestureRecognizer:tapGesture];
}

#pragma mark - 左边个人中心按键方法

- (void)leftButtonAction:(UIButton *)sender
{
    [self showMineCenter];
}

#pragma mark - 点击alpha视图的方法

- (void)hiddenTheView:(UITapGestureRecognizer *)gesture
{
    [self hiddenMineCenter];
}

#pragma mark - 隐藏个人中心

- (void)hiddenMineCenter
{
    NSLog(@"hidden");
    [UIView animateWithDuration:0.2 animations:^{
        
        NSLog(@"%@",self.mineCenterView);
        NSLog(@"%@",self.navigationController.view);
        self.navigationController.view.transform = CGAffineTransformMakeTranslation(0, 0);
        self.mineCenterView.center = CGPointMake(self.mineCenterView.center.x - moveX, self.mineCenterView.center.y);
    } completion:^(BOOL finished) {
        _alphaView.hidden = YES;
    }];
}

- (void)showMineCenter
{

    NSLog(@"show");
    NSLog(@"%@",self.mineCenterView);
    NSLog(@"%@",self.navigationController.view);

    [UIView animateWithDuration:0.2 animations:^{
        self.mineCenterView.center = CGPointMake(self.mineCenterView.center.x + moveX, self.mineCenterView.center.y);
        self.navigationController.view.transform = CGAffineTransformMakeTranslation(moveX, 0);
    }completion:^(BOOL finished) {
        _alphaView.hidden = NO;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
