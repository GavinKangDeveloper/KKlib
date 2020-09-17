//
//  UILabel+KKTools.m
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/16.
//

#import "UILabel+KKTools.h"

@implementation UILabel (KKTools)

- (void)kk_setStrikethroughWithText:(NSString *)text {
    [self kk_setStrikethroughWithText:text lineColor:nil];
}

- (void)kk_setStrikethroughWithText:(NSString *)text lineColor:(UIColor *)lineColor {
    NSDictionary *dicAttribute = @{
                                   NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                                   NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)
                                   };
    NSMutableDictionary *mDicAttribute = [[NSMutableDictionary alloc] initWithDictionary:dicAttribute];
    if (lineColor) {
        [mDicAttribute setObject:lineColor forKey:NSStrikethroughColorAttributeName];
    }
    [self setLineWithAttributes:[mDicAttribute copy] text:text];
}

- (void)kk_setUnderlineWithText:(NSString *)text {
    [self kk_setUnderlineWithText:text lineColor:nil];
}

- (void)kk_setUnderlineWithText:(NSString *)text lineColor:(UIColor *)lineColor {
    NSDictionary *dicAttribute = @{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle) };
    NSMutableDictionary *mDicAttribute = [[NSMutableDictionary alloc] initWithDictionary:dicAttribute];
    if (lineColor) {
        [mDicAttribute setObject:lineColor forKey:NSUnderlineColorAttributeName];
    }
    [self setLineWithAttributes:[mDicAttribute copy] text:text];
}

#pragma mark - Private Method
- (void)setLineWithAttributes:(NSDictionary *)attributes text:(NSString *)text {
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text
                                                                           attributes:attributes];
    self.attributedText = attributedString;
}

@end
