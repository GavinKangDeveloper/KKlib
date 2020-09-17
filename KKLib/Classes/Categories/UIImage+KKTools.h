//
//  UIImage+KKTools.h
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (KKTools)

#pragma mark - 根据尺寸裁剪图片
/**
 *  根据宽高大小，获取对应的裁剪图片
 *
 *  @param size 宽高大小
 *
 *  @return 对应的裁剪图片
 */
- (UIImage *)kk_croppedImageToSize:(CGSize)size;

/**
 *  根据宽高大小，获取对应的裁剪图片
 *
 *  @param rect 裁剪位置
 *
 *  @return 对应的裁剪图片
 */
- (UIImage *)kk_croppedImageToRect:(CGRect)rect;


#pragma mark - 根据尺寸或者比例，缩放图片
/**
 *  根据宽高大小，获取对应的缩放图片
 *
 *  @param size 宽高大小
 *
 *  @return 对应的缩放图片
 */
- (UIImage *)kk_rescaleImageToSize:(CGSize)size;
/**
 *  根据宽高大小，获取对应的缩放图片
 *
 *  @param scale 缩放比例
 *
 *  @return 对应的缩放图片
 */
- (UIImage *)kk_rescaleImageOfScale:(CGFloat)scale;

@end

NS_ASSUME_NONNULL_END
