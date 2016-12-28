//
//  UIImage+Crop.m
//  Pods
//
//  Created by fang wang on 16/12/28.
//
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)

+ (UIImage*) circleImage:(UIImage*) image borderWidth:(CGFloat) borderWidth borderColor:(UIColor*) borderColor{
    
    if (!image) {
        
        return nil;
    }
    
    CGFloat width = CGImageGetWidth(image.CGImage);
    CGFloat height = CGImageGetHeight(image.CGImage);
    CGFloat radius = MIN(width, height) / 2 + borderWidth;
    CGRect rect = CGRectMake(0, 0, radius * 2, radius * 2);
    CGRect drawRect = CGRectInset(rect, borderWidth, borderWidth);
    CGPoint drawPoint = CGPointMake(radius - width / 2, radius - height / 2);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(context, YES);
    
    CGContextSaveGState(context);
    CGContextAddEllipseInRect(context, drawRect);
    CGContextClip(context);
    [image drawAtPoint:drawPoint];
    CGContextRestoreGState(context);
    
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextAddEllipseInRect(context, CGRectInset(rect, borderWidth/2, borderWidth/2));
    CGContextStrokePath(context);
    
    UIImage* circleimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return circleimage;
}

@end
