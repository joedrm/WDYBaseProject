
#import <UIKit/UIKit.h>

/** 用十六进制颜色生成UIColor */
@interface UIColor (HexString)

//@"ffffff" or @"#ffffff"
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert opacity:(float)opacity;
+ (UIColor *)colorWithHexString:(NSString *)str;

//0x2d3f4a
+ (UIColor *)colorWithHex:(long)hexColor opacity:(float)opacity;
+ (UIColor *)colorWithHex:(long)hexColor;
@end
