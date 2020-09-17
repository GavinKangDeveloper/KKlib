//
//  UIView+KKTools.m
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/16.
//

#import "UIView+KKTools.h"

@implementation UIView (KKTools)


- (void)setKk_x:(CGFloat)kk_x {
    CGRect frame = self.frame;
    frame.origin.x = kk_x;
    self.frame = frame;
}

- (CGFloat)kk_x {
    return self.frame.origin.x;
}

- (void)setKk_centerX:(CGFloat)kk_centerX {
    CGPoint center = self.center;
    center.x = kk_centerX;
    self.center = center;
}

- (CGFloat)kk_centerX {
    return self.center.x;
}

-(void)setKk_centerY:(CGFloat)kk_centerY {
    CGPoint center = self.center;
    center.y = kk_centerY;
    self.center = center;
}

- (CGFloat)kk_centerY {
    return self.center.y;
}

- (void)setKk_y:(CGFloat)kk_y {
    CGRect frame = self.frame;
    frame.origin.y = kk_y;
    self.frame = frame;
}

- (CGFloat)kk_y {
    return self.frame.origin.y;
}

- (void)setKk_size:(CGSize)kk_size {
    CGRect frame = self.frame;
    frame.size = kk_size;
    self.frame = frame;
}

- (CGSize)kk_size {
    return self.frame.size;
}

- (void)setKk_height:(CGFloat)kk_height {
    CGRect frame = self.frame;
    frame.size.height = kk_height;
    self.frame = frame;
}

- (CGFloat)kk_height {
    return self.frame.size.height;
}

- (void)setKk_width:(CGFloat)kk_width {
    CGRect frame = self.frame;
    frame.size.width = kk_width;
    self.frame = frame;
    
}

-(CGFloat)kk_width {
    return self.frame.size.width;
}

- (void)setKk_origin:(CGPoint)kk_origin {
    CGRect frame = self.frame;
    frame.origin = kk_origin;
    self.frame = frame;
}

- (CGPoint)kk_origin {
    return self.frame.origin;
}

//下面的方法会引起离屏渲染
- (void)kk_cornerWithOvalInRect:(CGRect)rect {
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    layer.path = aPath.CGPath;
    self.layer.mask = layer;
}

- (void)kk_cornerWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius {
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    layer.path = aPath.CGPath;
    self.layer.mask = layer;
}

- (void)kk_cornerWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii {
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                byRoundingCorners:corners
                                                      cornerRadii:cornerRadii];
    layer.path = aPath.CGPath;
    self.layer.mask = layer;
}

- (void)kk_cornerByRoundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius {
    [self kk_cornerWithRoundedRect:self.bounds
                 byRoundingCorners:corners
                       cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
}

//这里的渐变色不会引起离屏渲染
- (void)kk_addGradientLayerWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    [self kk_addGradientLayerWithStartColor:startColor
                                 startPoint:CGPointMake(0.0, 0.0)
                                   endColor:endColor
                                   endPoint:CGPointMake(1.0, 0.0)];
}

- (void)kk_addGradientLayerWithStartColor:(UIColor *)startColor startPoint:(CGPoint)startPoint endColor:(UIColor *)endColor endPoint:(CGPoint)endPoint {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = self.bounds;
   
    if (self.layer.sublayers.count == 0) {
        [self.layer insertSublayer:gradientLayer atIndex:0];
    } else {
        for (int i = 0; i < self.layer.sublayers.count; i++) {
            if ([self.layer.sublayers[i] isKindOfClass:[CAGradientLayer class]]) {
               NSMutableArray *arrs = [NSMutableArray arrayWithArray:self.layer.sublayers];
               arrs[i] = gradientLayer;
               self.layer.sublayers = [NSArray arrayWithArray:arrs];
               break;
            } else if (i == (self.layer.sublayers.count - 1)) {
               [self.layer insertSublayer:gradientLayer atIndex:0];
               break;
            }
        }
    }
}


@end
