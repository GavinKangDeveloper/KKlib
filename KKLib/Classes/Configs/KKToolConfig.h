//
//  KKToolConfig.h
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/8.
//

#ifndef KKToolConfig_h
#define KKToolConfig_h


#pragma mark - 打印日志
#ifdef DEBUG
# define kkLog(fmt, ...) NSLog((@"--->[函数名:%s]\n" "--->[行号:%d] \n" fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define NSLog(...);
#endif


#pragma mark - 数据类型转换
#define kkFuncSetSafeStringFromDic(value, dic, key) if([[dic objectForKey:key] isKindOfClass:[NSString class]]) { \
value = [dic objectForKey:key]; \
} else { value = @""; }

#define kkFuncSetSafeIntegerFromDic(value, dic, key) if([[dic objectForKey:key] isKindOfClass:[NSString class]] || [[dic objectForKey:key] isKindOfClass:[NSNumber class]]) { \
value = [[dic objectForKey:key] integerValue]; \
} else { value = 0; }

#define kkFuncSetSafeDicFromDic(value, dic, key) if([[dic objectForKey:key] isKindOfClass:[NSDictionary class]]) { \
value = [dic objectForKey:key]; \
} else { value = nil; }

#define kkFuncSetSafeArrayFromDic(value, dic, key) if([[dic objectForKey:key] isKindOfClass:[NSArray class]]) { \
value = [dic objectForKey:key]; \
} else { value = nil; }

#define kkFuncGetSafeArrayFromDic(dic, key) (([[dic objectForKey:key] \
isKindOfClass:[NSArray class]]) ? [dic objectForKey:key] : nil)

#define kkFuncGetSafeDicFromDic(dic, key) (([[dic objectForKey:key] \
isKindOfClass:[NSDictionary class]]) ? [dic objectForKey:key] : nil)

#define kkFuncGetSafeIntegerFromDic(dic, key) (([[dic objectForKey:key] \
isKindOfClass:[NSString class]] || \
[[dic objectForKey:key] isKindOfClass:[NSNumber class]]) ? \
[[dic objectForKey:key] integerValue] : 0)

#define kkFuncGetSafeDoubleFromDic(dic, key) (([[dic objectForKey:key] \
isKindOfClass:[NSString class]] || \
[[dic objectForKey:key] isKindOfClass:[NSNumber class]]) ? \
[[dic objectForKey:key] doubleValue] : 0)

#define kkFuncGetSafeBOOLFromDic(dic, key) (([[dic objectForKey:key] \
isKindOfClass:[NSString class]] || \
[[dic objectForKey:key] isKindOfClass:[NSNumber class]]) ? \
[[dic objectForKey:key] boolValue] : NO)

#define kkFuncGetSafeStringFromDic(dic, key) (([[dic objectForKey:key] \
isKindOfClass:[NSString class]]) ? [dic objectForKey:key] : @"")


#pragma mark - block
#define kkFuncWeakSelf(object) __weak typeof(object) weak##object = object
#define kkFuncStrongSelf(object) __strong typeof(object) strong##object = weak##object
#define kkFuncSafeBlock(block, ...) block ? block(__VA_ARGS__) : nil

#endif /* KKToolConfig_h */
