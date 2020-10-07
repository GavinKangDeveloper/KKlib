//
//  UIImageView+KKTools.m
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/17.
//

#import "UIImageView+KKTools.h"

@implementation UIImageView (KKTools)


- (void)kk_changeImageColor:(UIColor *)imageColor {
    // 以清晰原图去除颜色信息渲染图片；即变成灰色的清晰图片；可用于改变 png 图标的颜色
    UIImage *imgRender = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    self.image = imgRender;
    self.tintColor = imageColor;
}

@end
