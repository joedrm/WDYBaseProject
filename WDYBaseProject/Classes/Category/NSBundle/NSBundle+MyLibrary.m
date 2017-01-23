//
//  NSBundle+MyLibrary.m
//  Pods
//
//  Created by fang wang on 17/1/9.
//
//

#import "NSBundle+MyLibrary.h"
#import "TipsView.h"

@implementation NSBundle (MyLibrary)

+ (instancetype)resourceBundleWithClass:(Class)nameClass
{
    static NSBundle *refreshBundle = nil;
    if (refreshBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        refreshBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:nameClass] pathForResource:@"WDYBaseProject" ofType:@"bundle"]];
    }
    return refreshBundle;
}

+ (UIImage *)tips_doneImage
{
    static UIImage *tips_doneImage = nil;
    if (tips_doneImage == nil) {
        tips_doneImage = [[UIImage imageWithContentsOfFile:[[TipsView class] pathForResource:@"tips_done@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return tips_doneImage;
}

+ (UIImage *)tips_errorImage{
    static UIImage *errorImage = nil;
    if (errorImage == nil) {
        errorImage = [[UIImage imageWithContentsOfFile:[[TipsView class] pathForResource:@"tips_error@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return errorImage;
}

+ (UIImage *)tips_infoImage{
    static UIImage *infoImage = nil;
    if (infoImage == nil) {
        infoImage = [[UIImage imageWithContentsOfFile:[[TipsView class] pathForResource:@"tips_info@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return infoImage;
}

@end
