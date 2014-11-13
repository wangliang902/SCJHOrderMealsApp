//
//  WLAboutViewController.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/12.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLAboutViewController.h"

@interface WLAboutViewController ()

@end

@implementation WLAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.mineCenterView selectMineView:^(NSInteger index) {
        [self hiddenMineCenter];
        [self.navigationController popViewControllerAnimated:NO];
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
