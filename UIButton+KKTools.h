//
//  UIButton+KKTools.h
//  KKLib
//
//  Created by ZhuKangKang on 2020/11/21.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KKButtonEdgeInsetsStyle) {
    KKButtonEdgeInsetsStyleTop, // image在上，label在下
    KKButtonEdgeInsetsStyleLeft, // image在左，label在右
    KKButtonEdgeInsetsStyleBottom, // image在下，label在上
    KKButtonEdgeInsetsStyleRight // image在右，label在左
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (KKTools)


#pragma mark - 设置 title 和 image 的布局样式和间距
/**
 *  设置 title和 image 的布局样式和间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)kk_layoutButtonWithEdgeInsetsStyle:(KKButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;


@end

NS_ASSUME_NONNULL_END
