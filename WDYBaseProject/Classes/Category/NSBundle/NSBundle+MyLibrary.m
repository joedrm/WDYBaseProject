//
//  NSBundle+MyLibrary.m
//  Pods
//
//  Created by fang wang on 17/1/9.
//
//

#import "NSBundle+MyLibrary.h"

@implementation NSBundle (MyLibrary)

+ (NSBundle *)myLibraryBundleWithClassStr:(NSString *)className{
    return [self bundleWithURL:[self myLibraryBundleURLClassStr:className]];
}


+ (NSURL *)myLibraryBundleURLClassStr:(NSString *)className {
    if (className == nil || className.length == 0) {
        return nil;
    }
    Class class = NSClassFromString(className);
    NSBundle *bundle = [NSBundle bundleForClass:class];
    return [bundle URLForResource:@"WDYBaseProject" withExtension:@"bundle"];
}


@end
