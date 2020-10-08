//
//  NSString+KKTools.h
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (KKTools)

#pragma mark - 获得字符串显示的宽度或者高度
/// 获得显示的字符串高度
/// @param font 字体大小
/// @param width 现实的宽度
/// @param lineHeight 行高
- (CGFloat)kk_getHeightWithFont:(UIFont *)font width:(CGFloat)width lineHeight:(CGFloat)lineHeight;

/// 获得显示的字符串高度
/// @param font 字体大小
- (CGFloat)kk_getWidthWithFont:(UIFont *)font;

#pragma mark - 正则表达式验证内容
/**
 过滤掉指定的正则匹配数据
 @param pattern 过滤规则
 @return NSString 过滤后的字符串
 */
- (NSString *)kk_filterStringWithPattern:(NSString *)pattern;

/**
 手机号 YES：真，NO：假
 */
- (BOOL)kk_checkIsPhone;

/**
 身份证 YES：真，NO：假
 */
- (BOOL)kk_checkIsUserIDCard;

/**
 字符串中只有数字／字母／汉字 YES：真，NO：假
 */
- (BOOL)kk_checkIsNumberOrLetterOrChinese;

/**
 字符串中只有数字 YES：真，NO：假
 */
- (BOOL)kk_checkIsNumber;

/**
 密码：6-18位的英文大小写，数字， YES：真，NO：假
 */
- (BOOL)kk_checkIsPassword;

/**
 邮箱 YES：真，NO：假
 */
- (BOOL)kk_checkIsEmail;


#pragma mark - 其它功能



#pragma mark - 打开
/**
 *  根据协议内容的 URL 字符串，进行打开动作；iOS「UIApplicationOpenSettingsURLString」可以跳转到系统设置界面
 *
 *  @param openURLStr 协议内容的 URL 字符串
 */
+ (void)kk_open:(NSString *)openURLStr;

/**
 *  打开浏览器
 */
- (void)kk_openByBrowser;

/**
 *  打开邮件
 */
- (void)kk_openByEmail;

/**
 *  拨打电话
 */
- (void)kk_openByTelephone;

/**
 *  打开短信（Short Messaging Service）
 */
- (void)kk_openBySMS;

#pragma mark - 修改阿里云图片的尺寸
/**
 根据宽高尺寸，返回对应大小比例的图片地址（以宽高两者最小值为处理规则）

 @param size 宽高尺寸
 @return 对应大小比例的图片地址（以宽高两者最小值为处理规则）
 */
- (NSString *)kk_imageResize:(CGSize)size;

/**
 根据宽高两者最小值，返回对应大小比例的图片地址（以宽高两者最小值为处理规则）

 @param minValue 宽高两者最小值
 @return 对应大小比例的图片地址（以宽高两者最小值为处理规则）
 */
- (NSString *)kk_imageResizeWithMinValue:(CGFloat)minValue;


#pragma mark - 字典、数组、字符串的相互转换
/**
 *  字典转换为 JSON 字符串
 *
 *  @param dic 字典
 *
 *  @return JSON 字符串
 */
+ (NSString *)kk_dictionaryToJSON:(NSDictionary *)dic;

/**
 *  数组转换为 JSON 字符串
 *
 *  @param arr 数组
 *
 *  @return JSON 字符串
 */
+ (NSString *)kk_arrayToJSON:(NSArray *)arr;

/**
 JSON 字符串转换为字典

 @return 字典
 */
- (NSDictionary *)kk_stringToDictionary;

/**
 JSON 字符串转换为数组

 @return 数组
 */
- (NSArray *)kk_stringToArray;

@end

NS_ASSUME_NONNULL_END
