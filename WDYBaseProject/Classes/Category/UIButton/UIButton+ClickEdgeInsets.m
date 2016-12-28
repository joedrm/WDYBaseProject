//
//  UIButton+ClickEdgeInsets.m
//  Categories
//
//  Created by lisong on 2016/10/14.
//  Copyright © 2016年 lisong. All rights reserved.
//

#import "UIButton+ClickEdgeInsets.h"
#import <objc/runtime.h>

@implementation UIButton (ClickEdgeInsets)

- (UIEdgeInsets)clickEdgeInsets
{
    return [objc_getAssociatedObject(self, @selector(clickEdgeInsets)) UIEdgeInsetsValue];
}

- (void)setClickEdgeInsets:(UIEdgeInsets)clickEdgeInsets
{
    objc_setAssociatedObject(self, @selector(clickEdgeInsets), [NSValue valueWithUIEdgeInsets:clickEdgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (UIEdgeInsetsEqualToEdgeInsets(self.clickEdgeInsets, UIEdgeInsetsZero))
    {
        return [super pointInside:point withEvent:event];
    }
    else
    {
        CGRect large = UIEdgeInsetsInsetRect(self.bounds, self.clickEdgeInsets);
        return CGRectContainsPoint(large, point) ? YES : NO;
    }
}

@end
