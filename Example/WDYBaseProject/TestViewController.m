//
//  TestViewController.m
//  WDYBaseProject
//
//  Created by fang wang on 16/12/29.
//  Copyright © 2016年 冬日暖阳. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController configNavBarWithBackImage:[UIImage imageNamed:@"envelope"] shadowImage:nil tintColor:[UIColor redColor] barTintColor:[UIColor whiteColor] titleColor:[UIColor whiteColor] titleFont:kFontWithSize(12) hideBackTitle:YES];
    
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//    }
    
    // 测试返回按钮到屏幕左边的间距 实现 UINavigationItem+Addition
    UIButton* leftBtn = [[UIButton alloc] init];
    [leftBtn setBackgroundColor:[UIColor redColor] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, 40, 40);
    [leftBtn addActionHandler:^{
        NSLog(@"我要返回了...");
        
        [self.navigationController popViewControllerAnimated:YES];
    }]; 
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    UIButton* rightBtn = [[UIButton alloc] init];
    [rightBtn setBackgroundColor:[UIColor blueColor] forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 40, 40);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

- (BOOL)navigationShouldPopOnBackButton{
    
    return NO;
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
