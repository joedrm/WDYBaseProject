//
//  NSBundle+MyLibrary.h
//  Pods
//
//  Created by fang wang on 17/1/9.
//
//

#import <Foundation/Foundation.h>

@interface NSBundle (MyLibrary)

+ (instancetype)resourceBundleWithClass:(Class)nameClass;
+ (UIImage *)tips_doneImage;
+ (UIImage *)tips_errorImage;
+ (UIImage *)tips_infoImage;
@end
