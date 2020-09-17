//
//  UIView+KKTools.h
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (KKTools)

#pragma mark - 获得当前 frame 相关属性
@property (nonatomic, assign) CGFloat kk_x;
@property (nonatomic, assign) CGFloat kk_y;
@property (nonatomic, assign) CGFloat kk_centerX;
@property (nonatomic, assign) CGFloat kk_centerY;
@property (nonatomic, assign) CGFloat kk_width;
@property (nonatomic, assign) CGFloat kk_height;
@property (nonatomic, assign) CGSize  kk_size;
@property (nonatomic, assign) CGPoint kk_origin;

#pragma mark - 设置圆角
/**
 *  根据位置尺寸，设置视图椭圆圆角
 *
 *  @param rect 位置尺寸
 */
- (void)kk_cornerWithOvalInRect:(CGRect)rect;

/**
 *  根据位置尺寸和圆角半径，设置视图标准圆角
 *
 *  @param rect         位置尺寸
 *  @param cornerRadius 圆角半径
 */
- (void)kk_cornerWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;

/**
 *  根据位置尺寸和生效圆角「头左、头右、底左、底右」、圆角半径宽高，设置视图标准圆角
 *
 *  @param rect        位置尺寸
 *  @param corners     生效圆角；例如：UIRectCornerBottomLeft | UIRectCornerBottomRight 来设置两个圆角
 *  @param cornerRadii 圆角半径宽高
 */
- (void)kk_cornerWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

/**
 *  根据生效圆角「头左、头右、底左、底右」、圆角半径，设置视图圆角
 *
 *  @param corners      生效圆角；例如：UIRectCornerBottomLeft | UIRectCornerBottomRight 来设置两个圆角
 *  @param cornerRadius 圆角半径
 */
- (void)kk_cornerByRoundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius;


#pragma mark - 渐变色
/// 渐变色 这里固定左右渐变
/// @param startColor startColor 开始颜色
/// @param endColor endColor 结束颜色
- (void)kk_addGradientLayerWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;

/// 渐变色
/// @param startColor 开始颜色
/// @param startPoint 开始点
/// @param endColor 结束颜色
/// @param endPoint 结束点
- (void)kk_addGradientLayerWithStartColor:(UIColor *)startColor startPoint:(CGPoint)startPoint endColor:(UIColor *)endColor endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
