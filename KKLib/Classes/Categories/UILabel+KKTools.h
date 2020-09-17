//
//  UILabel+KKTools.h
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (KKTools)

/**
 为文本标签内容加删除线（中划线）

 @param text 文本标签内容
 */
- (void)kk_setStrikethroughWithText:(NSString *)text;

/**
 为文本标签内容加删除线（中划线）；同时设置下划线颜色

 @param text 文本标签内容
 @param lineColor 下划线颜色
 */
- (void)kk_setStrikethroughWithText:(NSString *)text lineColor:(UIColor *)lineColor;

/**
 为文本标签内容加下划线

 @param text 文本标签内容
 */
- (void)kk_setUnderlineWithText:(NSString *)text;

/**
 为文本标签内容加下划线；同时设置下划线颜色

 @param text 文本标签内容
 @param lineColor 下划线颜色
 */
- (void)kk_setUnderlineWithText:(NSString *)text lineColor:(UIColor *)lineColor;

@end

NS_ASSUME_NONNULL_END
