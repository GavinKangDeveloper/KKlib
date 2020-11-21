//
//  NSDate+KKTools.h
//  KKLib
//
//  Created by ZhuKangKang on 2020/11/21.
//

#import <Foundation/Foundation.h>

#define kTimeZoneUTC ([NSTimeZone timeZoneWithAbbreviation:@"UTC"])
#define kTimeZoneBeijing ([NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"])

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (KKTools)

/**
 *  获取本地当前时间
 *
 *  @return 本地当前时间
 */
+ (NSDate *)kk_localeDate;

/**
 *  根据时间字符串和其格式，获取对应的时间
 *
 *  @param dateStr 时间字符串
 *  @param format  时间字符串格式（默认值为@"yyyy-MM-dd HH:mm"）
 *
 *  @return 对应的时间
 */
+ (NSDate *)kk_dateFromString:(NSString *)dateStr format:(NSString *)format;

/**
 *  根据时间和其格式，获取对应的时间字符串
 *
 *  @param date    时间
 *  @param format  时间字符串格式（默认值为@"yyyy-MM-dd HH:mm"）
 *
 *  @return 对应的时间字符串
 */
+ (NSString *)kk_dateToString:(NSDate *)date format:(NSString *)format;

/// 根据时间字符串和其格式，获取对应的时间（北京时间）
/// @param dateStr 时间字符串
/// @param format  时间字符串格式（默认值为@"yyyy-MM-dd HH:mm"）
/// @return
+ (NSDate *)kk_dateFromBeijingString:(NSString *)dateStr format:(NSString *)format;

///
/// @param date 时间
/// @param format 时间字符串格式（默认值为@"yyyy-MM-dd HH:mm"）
/// @return 对应的时间字符串
+ (NSString *)kk_dateToBeijingString:(NSDate *)date format:(NSString *)format;

/// 根据「年、月、日、时、分、秒」，获取对应的时间
/// @param year 年
/// @param month 月
/// @param day 日
/// @param hour 时
/// @param minute 分
/// @param second 秒
/// @return 对应的时间
+ (NSDate *)kk_dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second;

/// 根据「时、分」，获取对应的时间
/// @param hour 时
/// @param minute 分
/// @return 对应的时间
+ (NSDate *)kk_dateWithHour:(NSInteger)hour minute:(NSInteger)minute;

/// 根据「时:分」字符串，获取对应的时间
/// @param time 「时:分」字符串
/// @return 对应的时间
+ (NSDate *)kk_dateWithTime:(NSString *)time;

/// 根据秒数，获取对应格式化的时间字符串；例如：90 秒对应 00:01:30
/// @param seconds 秒数
/// @return 对应格式化的时间字符串
+ (NSString *)kk_timeFormatFromSeconds:(NSTimeInterval)seconds;

@end

NS_ASSUME_NONNULL_END
