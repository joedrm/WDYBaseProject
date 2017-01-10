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
    [self.view addSubview:imageV];
    
    // 上面图片，下面文字的按钮
    LayoutButton* btn = [[LayoutButton alloc] init];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 300, 80, 80);
    btn.layoutStyle = LayoutButtonStyleUpImageDownTitle;
    btn.imageSize = CGSizeMake(40, 40);
    btn.midSpacing = 12;
    [btn addActionHandler:^{
        
        [MBProgressHUD showWarn:@"waring" ToView:self.view];
//        TestViewController* testVC = [[TestViewController alloc] init];
//        [self.navigationController pushViewController:testVC animated:YES];
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
    
    UIBezierPath* path = [UIBezierPath stars:3 shapeInFrame:CGRectMake(0, 0, 100, 100)];
    CAShapeLayer* shaperLayer = [CAShapeLayer layer];
    shaperLayer.backgroundColor = [UIColor blueColor].CGColor;
    shaperLayer.frame = CGRectMake(0, 0, 100, 100);
    shaperLayer.path = path.CGPath;
    shaperLayer.position = CGPointMake(kScreenWidth*0.5, kScreenHeight*0.7);
    [shaperLayer setFillColor:[UIColor whiteColor].CGColor];
    [self.view.layer addSublayer:shaperLayer];
    
}

@end

/*
 参考资料：
 
 http://blog.csdn.net/u012390519/article/details/48497343
 https://github.com/Raizlabs/RZUtils
 https://github.com/Damonvvong/DWCategory
 
 */
