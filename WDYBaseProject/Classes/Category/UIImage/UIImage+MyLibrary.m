//
//  UIImage+MyLibrary.m
//  Pods
//
//  Created by fang wang on 17/1/9.
//
//

#import "UIImage+MyLibrary.h"

#import "NSBundle+MyLibrary.h"

@implementation UIImage (MyLibrary)

+ (UIImage *)my_bundleImageNamed:(NSString *)imgName myClassName:(NSString *)myClassName{
    return [self my_imageNamed:imgName inBundle:[NSBundle myLibraryBundleWithClassStr:myClassName]];
}


+ (UIImage *)my_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    return [self imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
#elif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
    return [self imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
#else
    if ([self respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        return [self imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    } else {
        return [self imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
    }
#endif
}
@end
