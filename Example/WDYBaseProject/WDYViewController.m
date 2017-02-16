//
//  WDYViewController.m
//  WDYBaseProject
//
//  Created by 冬日暖阳 on 12/28/2016.
//  Copyright (c) 2016 冬日暖阳. All rights reserved.
//

#import "WDYViewController.h"
#import "TestViewController.h"



@interface WDYViewController ()

@end

@implementation WDYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage* image = [UIImage circleImage:[UIImage imageWithColor:[UIColor blueColor]] borderWidth:0.0 borderColor:[UIColor blackColor]];
    UIImageView* imageV = [[UIImageView alloc] init];
    imageV.frame = CGRectMake(100, 100, 100, 100);
    imageV.image = image;
    [self.view addSubview:imageV];
    
    // 上面图片，下面文字的按钮
    LayoutButton* btn = [[LayoutButton alloc] init];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 300, 80, 80);
    btn.layoutStyle = LayoutButtonStyleUpImageDownTitle;
    btn.imageSize = CGSizeMake(40, 40);
    btn.midSpacing = 12;
    [btn addActionHandler:^{
        TestViewController* testVC = [[TestViewController alloc] init];
        [self.navigationController pushViewController:testVC animated:YES];
    }];
    [btn setImage:[UIImage imageNamed:@"envelope"] forState:UIControlStateNormal];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [self configNavBarWithBackImage:[UIImage imageNamed:@"envelope"] shadowImage:nil tintColor:[UIColor redColor] barTintColor:[UIColor whiteColor] titleColor:[UIColor whiteColor] titleFont:kFontWithSize(12) hideBackTitle:YES];
    
    
    NSString* filePath = [NSFileManager cachesPath];
    NSLog(@"filePath = %@", filePath);
    
    NSLog(@"kDocumentPath = %@", kDocumentPath);
    
    // 1
    __block BOOL flag = NO;
    NSLog(@"start................");
    [[NSRunLoop currentRunLoop] performBlockAndWait:^(BOOL *finish) {
        double delayInSeconds = 5.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_after(popTime, queue, ^(void){
            // 2
            NSLog(@"delay................");
            flag = YES;
            *finish = YES;
        });
    }];
    
    // 3
    NSLog(@"%d  end............", flag);
    
    UIBezierPath* path = [UIBezierPath customBezierPathOfArrowSymbolWithRect:CGRectMake(0, 0, 20, 25) scale:1.0 thick:3 direction:kUIBezierPathArrowDirectionLeft];
    CAShapeLayer* shaperLayer = [CAShapeLayer layer];
    shaperLayer.backgroundColor = [UIColor colorWithHexString:@"F1F1F1"].CGColor;
    shaperLayer.frame = CGRectMake(0, 0, 100, 100);
    shaperLayer.path = path.CGPath;
    shaperLayer.position = CGPointMake(kScreenWidth*0.5, kScreenHeight*0.7);
    [shaperLayer setFillColor:[UIColor colorWithHexString:@"2FA3E1"].CGColor];
    [self.view.layer addSublayer:shaperLayer];
    
    
    NSArray* testArr = @[@"a", @"b"];
    NSLog(@"测试数组越界 %@", testArr[3]);
    
    UIView *parentView = self.navigationController.view;
    [TipsView showLoading:@"加载中..." inView:parentView hideAfterDelay:2];
}

@end

/*
 参考资料：
 
 http://blog.csdn.net/u012390519/article/details/48497343
 https://github.com/Raizlabs/RZUtils
 https://github.com/Damonvvong/DWCategory
 https://github.com/shaojiankui/JKCategories
 https://github.com/wujunyang/MobileProject
 https://github.com/QMUI/QMUI_iOS
 https://github.com/mk2016/MKToolsKit
 http://www.cnblogs.com/brycezhang/p/4117180.html  使用CocoaPods开发并打包静态库 
 
 https://github.com/ElfSundae/AppComponents 开发常用组件
 */


