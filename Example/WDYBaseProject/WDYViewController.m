//
//  WDYViewController.m
//  WDYBaseProject
//
//  Created by 冬日暖阳 on 12/28/2016.
//  Copyright (c) 2016 冬日暖阳. All rights reserved.
//

#import "WDYViewController.h"
#import <WDYBaseProject/WDYCategory.h>
#import <WDYBaseProject/UIImageView+Blur.h>
#import <WDYBaseProject/UIImage+ImageEffects.h>
#import <WDYBaseProject/WDYMacros.h>
#import <WDYBaseProject/UIHeader.h>

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
    [btn setImage:[UIImage imageNamed:@"envelope"] forState:UIControlStateNormal];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    
    
    NSString* filePath = [NSFileManager cachesPath];
    NSLog(@"filePath = %@", filePath);
    
    NSLog(@"kDocumentPath = %@", kDocumentPath);
}

@end

/*
 参考资料：
 
 http://blog.csdn.net/u012390519/article/details/48497343
 
 */
