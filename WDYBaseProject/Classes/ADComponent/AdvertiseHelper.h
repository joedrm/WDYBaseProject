//
//  AdvertiseHelper.h
//  Pods
//
//  Created by fang wang on 17/1/9.
//
//

#import <Foundation/Foundation.h>

@interface AdvertiseHelper : NSObject

+ (instancetype)sharedInstance;

+(void)showAdvertiserView:(NSArray *)imageArray;

@end
