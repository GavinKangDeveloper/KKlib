//
//  UIImageView+KKTools.h
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (KKTools)


#pragma mark - 修改图片的颜色
/**
 *  设置图片视图里的图片颜色
 *
 *  @param imageColor 图片颜色
 */
- (void)kk_changeImageColor:(UIColor *)imageColor;


@end

NS_ASSUME_NONNULL_END
