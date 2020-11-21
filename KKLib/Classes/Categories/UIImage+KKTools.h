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

#pragma mark - 添加水印
/**
 添加水印文字
 
 @param text 文字内容
 @param alignment 字体的样式
 @param fontSize 字体大小
 @param textColor 字体颜色
 @param rect 添加文字的位置，以图片左上角为原点
 */
- (UIImage *)kk_waterMarkImageText:(NSString *)text alignment:(NSTextAlignment)alignment fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor WithRect:(CGRect)rect;

/**
 方法一：添加水印图片

 @param logoImage 水印图片
 @param rect 添加图片的位置，以图片左上角为原点
 */
- (UIImage *)kk_addImageLogo:(UIImage *)logoImage WithRect:(CGRect)rect;

/**
 方法二：添加水印图片

 @param logoImage 水印图片
 @param rect 添加图片的位置，以图片左上角为原点
 */
- (UIImage *)kk_addImageLogo:(UIImage *)logoImage WithLogoRect:(CGRect)rect;


@end

NS_ASSUME_NONNULL_END
