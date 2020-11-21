//
//  UIImage+KKTools.m
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/17.
//

#import "UIImage+KKTools.h"

@implementation UIImage (KKTools)

- (UIImage *)kk_croppedImageToSize:(CGSize)size {
    return [self kk_croppedImageToRect:CGRectMake(0.0, 0.0, size.width, size.height)];
}

- (UIImage *)kk_croppedImageToRect:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);

    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextDrawImage(contextRef, rect, imageRef);
    UIImage *outputImage = [UIImage imageWithCGImage:imageRef];
    UIGraphicsEndImageContext();

    CGImageRelease(imageRef);
    return outputImage;
}

- (UIImage *)kk_rescaleImageToSize:(CGSize)size {
    // ceilf 函数为向上取整；例如(44.664, 14.316)就转为(45, 15)；避免出现无法渲染的情况，错误信息：CGBitmapContextCreateImage: invalid context 0x0. This is a serious error. This application, or a library it uses, is using an invalid context  and is thereby contributing to an overall degradation of system stability and reliability.
    // http://stackoverflow.com/questions/26567992/many-cgcontext-invalid-context-0x0-errors-ios-8
    size = CGSizeMake(ceilf(size.width), ceilf(size.height));
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    
    // 性能比较：http://nshipster.com/image-resizing/
    // 方式一：「UIKit」使用 drawInRect: 方法，性能差，不建议用
    //    UIGraphicsBeginImageContext(rect.size);
    //    [self drawInRect:rect];
    //    UIImage *imgScale = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    
    // 方式二：「Core Graphics」使用 CGContextDrawImage 函数，性能还不错，建议用；注意都存在占用内存的情况
    CGImageRef imageRef = [self CGImage];
    CGImageAlphaInfo imageAlphaInfo = CGImageGetAlphaInfo(imageRef);
    if (imageAlphaInfo == kCGImageAlphaNone)
        imageAlphaInfo = kCGImageAlphaNoneSkipLast;
    
    CGContextRef contextRef = CGBitmapContextCreate(
                                                    NULL,
                                                    rect.size.width,
                                                    rect.size.height,
                                                    CGImageGetBitsPerComponent(imageRef),
                                                    rect.size.width * 4,
                                                    CGImageGetColorSpace(imageRef),
                                                    imageAlphaInfo
                                                    );
    CGContextDrawImage(contextRef, rect, imageRef);
    imageRef = CGBitmapContextCreateImage(contextRef);
    UIImage *outputImage = [UIImage imageWithCGImage:imageRef];
    
    CGImageRelease(imageRef);
    CGContextRelease(contextRef);
    return outputImage;
}

- (UIImage *)kk_rescaleImageOfScale:(CGFloat)scale {
    CGSize size = CGSizeMake(self.size.width * scale, self.size.height * scale);
    return [self kk_rescaleImageToSize:size];
}

#pragma mark - 添加水印
- (UIImage *)kk_waterMarkImageText:(NSString *)text alignment:(NSTextAlignment)alignment fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor WithRect:(CGRect)rect {
    //1.获取上下文
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = alignment;
    NSDictionary *dic = @{
                          NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                          NSParagraphStyleAttributeName:style,
                          NSForegroundColorAttributeName:textColor
                          };
    //将文字绘制上去
    [text drawInRect:rect withAttributes:dic];
    //4.获取绘制到得图片
    UIImage *watermarkImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return watermarkImage;
}

- (UIImage *)kk_addImageLogo:(UIImage *)logoImage WithRect:(CGRect)rect {
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [logoImage drawInRect:rect];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

- (UIImage *)kk_addImageLogo:(UIImage *)logoImage WithLogoRect:(CGRect)rect {
    int w = self.size.width;
    int h = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), self.CGImage);
    CGContextDrawImage(context, rect, logoImage.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
}


@end
