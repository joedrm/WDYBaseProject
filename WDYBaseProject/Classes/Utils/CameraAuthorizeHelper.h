//
//  CameraAuthorizeHelper.h
//  Pods
//
//  Created by fang wang on 17/1/10.
//
//

#import <Foundation/Foundation.h>

@interface CameraAuthorizeHelper : NSObject


/**
 * 检查系统"照片"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (BOOL)checkPhotoLibraryAuthorizationStatus;

/**
 * 检查系统"相机"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (BOOL)checkCameraAuthorizationStatus;


@end
