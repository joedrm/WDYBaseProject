//
//  UIImageView+AnimForSDWebImage.h
//  Pods
//
//  Created by fang wang on 16/12/28.
//
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImageCompat.h>
#import <SDWebImage/SDWebImageManager.h>

@interface UIImageView (AnimForSDWebImage)

- (NSURL *)sd_imageURL;

- (void)sd_setImageWithURL:(NSURL *)url fadeAnimation:(BOOL)fadeAnimation;

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder fadeAnimation:(BOOL)fadeAnimation;

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options fadeAnimation:(BOOL)fadeAnimation;

- (void)sd_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock fadeAnimation:(BOOL)fadeAnimation;

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock fadeAnimation:(BOOL)fadeAnimation;

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock fadeAnimation:(BOOL)fadeAnimation;

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(SDWebImageOptions)options progress:(nullable SDWebImageDownloaderProgressBlock)progressBlock completed:(nullable SDWebImageCompletionBlock)completedBlock fadeAnimation:(BOOL)fadeAnimation;

- (void)sd_setImageWithPreviousCachedImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock fadeAnimation:(BOOL)fadeAnimation;

- (void)sd_setAnimationImagesWithURLs:(NSArray *)arrayOfURLs;

- (void)sd_cancelCurrentImageLoad;

- (void)sd_cancelCurrentAnimationImagesLoad;

@end
