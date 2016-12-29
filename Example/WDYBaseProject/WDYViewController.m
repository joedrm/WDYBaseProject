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
    imageV.image = [image blurryWithBlurLevel:1];
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
}

@end

/*
 参考资料：
 
 http://blog.csdn.net/u012390519/article/details/48497343
 
 */
