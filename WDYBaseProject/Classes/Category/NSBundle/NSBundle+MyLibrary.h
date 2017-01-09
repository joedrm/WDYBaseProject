//
//  NSBundle+MyLibrary.h
//  Pods
//
//  Created by fang wang on 17/1/9.
//
//

#import <Foundation/Foundation.h>

@interface NSBundle (MyLibrary)

+ (NSBundle *)myLibraryBundleWithClassStr:(NSString *)className;
+ (NSURL *)myLibraryBundleURLClassStr:(NSString *)className;

@end
