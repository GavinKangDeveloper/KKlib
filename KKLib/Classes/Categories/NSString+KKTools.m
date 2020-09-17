//
//  NSString+KKTools.m
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/8.
//

#import "NSString+KKTools.h"

@implementation NSString (KKTools)

#pragma mark - 获得字符串显示的宽度或者高度
- (CGFloat)kk_getHeightWithFont:(UIFont *)font width:(CGFloat)width lineHeight:(CGFloat)lineHeight {
    if (self.length == 0) {
        return 20 + lineHeight;
    }
    CGSize titleSize = [self boundingRectWithSize:CGSizeMake(width, 0)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{
                                           NSFontAttributeName : font
                                       }
                                          context:nil].size;
    CGFloat height = titleSize.height + 4;
    if (lineHeight > 0) {
        height += titleSize.height / font.pointSize * lineHeight;
    }
    return height;
}

- (CGFloat)kk_getWidthWithFont:(UIFont *)font {
    if ([self isEqual:[NSNull null]] || self.length == 0) {
        return 20;
    }
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName : font}];
    return size.width + 4;
}

#pragma mark - 正则表达式验证内容
- (NSString *)kk_filterStringWithPattern:(NSString *)pattern {
    if (!self || self.length <= 0) {
        return nil;
    }
    
    NSString *filterStr = nil;
    //创建一个正则表达式对象，存储匹配规则
    NSRegularExpression *regEx = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:0
                                                                             error:nil];
    if (regEx != nil) {
        //用该方法解析出所有
        NSArray *arr = [regEx matchesInString:self
                                      options:NSMatchingReportProgress
                                        range:NSMakeRange(0, self.length)];
        NSMutableArray *stringArrs= [[NSMutableArray alloc] init];
        
        //当解析出的数组至少有一个对象时，即原文本中存在至少一个符合规则的字段
        if (arr.count != 0) {
            for (NSTextCheckingResult *result in arr) {
                //从NSTextCheckingResult类中取出range属性
                NSRange range = result.range;
                //从原文本中将字段取出并存入一个NSMutableArray中
                [stringArrs addObject:[self substringWithRange:range]];
            }
        }
        filterStr = [stringArrs componentsJoinedByString:@""];
    }
    return filterStr;
}

- (BOOL)kk_checkIsPhone {
    NSString * mobile = @"^1[3|4|5|6|7|8][0-9]\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    return [pred evaluateWithObject:self];
}

- (BOOL)kk_checkIsUserIDCard {
    NSString *IDCard = self;
    IDCard = [IDCard stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (self.length == 15) {
        //|  地址  |   年    |   月    |   日    |
        NSString *regex = @"^(\\d{6})([3-9][0-9][01][0-9][0-3])(\\d{4})$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [identityCardPredicate evaluateWithObject:IDCard];
    } else if (self.length == 18) {
        //|  地址  |      年       |   月    |   日    |
        NSString *regex = @"^(\\d{6})([1][9][3-9][0-9][01][0-9][0-3])(\\d{4})(\\d|[X])$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [identityCardPredicate evaluateWithObject:IDCard];
    } else {
        return NO;
    }
}

- (BOOL)kk_checkIsNumberOrLetterOrChinese {
    NSString *regex = @"[a-zA-Z0-9-_\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

- (BOOL)kk_checkIsNumber {
    NSString *regex = @"^[0-9]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

- (BOOL)kk_checkIsPassword {
    NSString *realnameFilter = @"^.{6,18}$";
    NSPredicate *fliter = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",realnameFilter];
    return [fliter evaluateWithObject:self];
}

- (BOOL)kk_checkIsEmail {
    NSString *email = self;
    email = [email stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [pred evaluateWithObject:email];
}

- (NSAttributedString *)kk_deleteLineWithFont:(UIFont *)font lineColor:(UIColor *)lineColor {
    if (!self || self.length <= 0) {
        return nil;
    }
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    [attStr addAttributes:@{NSFontAttributeName               : font,
                            NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                            NSBaselineOffsetAttributeName     : @(0.5),
                            NSStrikethroughColorAttributeName : lineColor}
                    range:NSMakeRange(0, self.length)];
    return [attStr copy];
}

+ (void)kk_open:(NSString *)openURLStr {
    /*
     iOS 9出现「This app is not allowed to query for scheme weibo」的解决方式：
     就是在 Info.plist 文件中添加数组项「LSApplicationQueriesSchemes」，添加子项，意义是把需要调用的 App 协议设置为白名单
     <key>LSApplicationQueriesSchemes</key>
     <array>
     <string>weixin</string>
     </array>
     */
    
    NSURL *openURL = [NSURL URLWithString:openURLStr];
    if ([[UIApplication sharedApplication] canOpenURL:openURL]) {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:openURL
                                               options:@{ UIApplicationOpenURLOptionUniversalLinksOnly : @NO }
                                     completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:openURL];
        }
    }
}

- (void)kk_openByBrowser {
    [NSString kk_open:self];
}

- (void)kk_openByEmail {
    // 等同于 「mailto:%@」
    [NSString kk_open:[NSString stringWithFormat:@"mailto://%@", self]];
}

- (void)kk_openByTelephone {
    [NSString kk_open:[NSString stringWithFormat:@"tel://%@", self]];
}

- (void)kk_openBySMS {
    [NSString kk_open:[NSString stringWithFormat:@"sms://%@", self]];
}

- (NSString *)kk_imageResize:(CGSize)size {
    // 阿里云图片缩放指南： https://help.aliyun.com/document_detail/44688.html?spm=a2c4g.11186623.6.973.w4KsjY
    // 等比缩放，限定在矩形框外：将图缩略成宽度为100，高度为100，按短边优先。
    // http://image-demo.oss-cn-hangzhou.aliyuncs.com/example.jpg?x-oss-process=image/resize,m_mfit,h_100,w_100
    NSString *imageURLString = self;

    if (![imageURLString containsString:@"@"]) {
        NSArray *arrImageURLStringPart = [imageURLString componentsSeparatedByString:@"?"];
        NSString *exclamationSign = @"!";
        if ([imageURLString containsString:exclamationSign]) {
            arrImageURLStringPart = [imageURLString componentsSeparatedByString:exclamationSign];
        }
        NSInteger minVal = (NSInteger) (ceil(MIN(size.width, size.height) * [UIScreen mainScreen].scale));
        imageURLString = [NSString stringWithFormat:@"%@?x-oss-process=image/resize,m_mfit,h_%zd,w_%zd", arrImageURLStringPart[0], minVal, minVal];
    }
    return imageURLString;
}

- (NSString *)kk_imageResizeWithMinValue:(CGFloat)minValue {
    return [self kk_imageResize:CGSizeMake(minValue, minValue)];
}

+ (NSString *)kk_dictionaryToJSON:(NSDictionary *)dic {
    return [self objectToJSON:dic];
}

+ (NSString *)kk_arrayToJSON:(NSArray *)arr {
    return [self objectToJSON:arr];
}

- (NSDictionary *)kk_stringToDictionary {
    NSDictionary *dicData;
    id object = [self convertToObject];
    if ([object isKindOfClass:[NSDictionary class]]) {
        dicData = (NSDictionary *)object;
    }
    return dicData;
}

- (NSArray *)kk_stringToArray {
    NSArray *arrData;
    id object = [self convertToObject];
    if ([object isKindOfClass:[NSArray class]]) {
        arrData = (NSArray *)object;
    }
    return arrData;
}

#pragma mark - Private Method
+ (NSString *)objectToJSON:(NSObject *)object {
    NSError *parseError = nil;
    NSData *data;
    @try {
        // options 必须为 0，而不是 NSJSONWritingPrettyPrinted，NSJSONWritingPrettyPrinted 有空格和回车，会导致 H5 无法正确解析
        data = [NSJSONSerialization dataWithJSONObject:object
                                               options:0
                                                 error:&parseError];
    }
    @catch (NSException *exception) {
        return nil;
    }
    return parseError ? nil : [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (id)convertToObject {
    NSError *parseError = nil;
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    id object;
    @try {
        object = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingMutableContainers
                                                   error:&parseError];
    }
    @catch (NSException *exception) {
        return nil;
    }
    return parseError ? nil : object;
}

@end
