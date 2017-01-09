//
//  NSBundle+MyLibrary.m
//  Pods
//
//  Created by fang wang on 17/1/9.
//
//

#import "NSBundle+MyLibrary.h"

@implementation NSBundle (MyLibrary)

+ (NSBundle *)myLibraryBundleWithClassStr:(NSString *)name{
    return [self bundleWithURL:[self myLibraryBundleURLClassStr:name]];
}


+ (NSURL *)myLibraryBundleURLClassStr:(NSString *)name {
    if (name == nil || name.length == 0) {
        return nil;
    }
    Class class = NSClassFromString(name);
    NSBundle *bundle = [NSBundle bundleForClass:class];
    return [bundle URLForResource:@"WDYBaseProject" withExtension:@"bundle"];
}


@end
