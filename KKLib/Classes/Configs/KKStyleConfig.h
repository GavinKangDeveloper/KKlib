//
//  KKStyleConfig.h
//  KKLib
//
//  Created by ZhuKangKang on 2020/9/8.
//

#ifndef KKStyleConfig_h
#define KKStyleConfig_h



#pragma mark - 简化写法
#define kkApplication        [UIApplication sharedApplication]
#define kkScreen             [UIScreen mainScreen]
#define kkRunLoop            [NSRunLoop mainRunLoop]
#define kkBundle             [NSBundle mainBundle]
#define kkFileManager        [NSFileManager defaultManager]
#define kkUserDefaults       [NSUserDefaults standardUserDefaults]
#define kkNotificationCenter [NSNotificationCenter defaultCenter]


#pragma mark - 字体大小
#define kkFontOfSize(font) [UIFont systemFontOfSize:font]
#define kkBoldFontOfSize(font) [UIFont boldSystemFontOfSize:font]


#pragma mark - iOS 版本
#define kkOSVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define kkFuncGreaterThanOrEqualToOSVersion(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define kkFuncLessThanOSVersion(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


#pragma mark - App（包的唯一标示、显示名称、Version 版本）
#define kkAppBundleIdentifier [kkBundle bundleIdentifier]
#define kkAppDisplayName      [kkBundle objectForInfoDictionaryKey:@"CFBundleDisplayName"]
#define kkAppVersion          [kkBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"]


#pragma mark - 判断机型
#define kkFuncCheckDevice(deviceName) ([[UIDevice currentDevice].model isEqualToString:deviceName])

#pragma mark - 是否大于某个手机系统
#define kkFuncOverSystemNum(system) @available(iOS system, *)


#pragma mark - 是否是 iPhone、iPad、模拟器
#define kkIsPhone     (kkFuncCheckDevice(@"iPhone") || kkFuncCheckDevice(@"iPhone Simulator"))
#define kkIsPad       (kkFuncCheckDevice(@"iPad") || kkFuncCheckDevice(@"iPad Simulator"))
#define kkIsSimulator (TARGET_OS_SIMULATOR == 1)


// 判断机型；根据屏幕分辨率区别「像素」=屏幕大小「点素」*屏幕模式「iPhone 4开始比例就为2x」;iPhone 6 跟 7、8 一样；iPhone 6 Plus 跟 7 Plus、8 Plus 一样
// @2x 机型：4（320 x 480 pt，3.5 英寸）、5（320 x 568 pt，4 英寸）、6（375 x 667 pt，4.7 英寸）、XR（414 x 896 pt，6.1 英寸）
// @3x 机型：6Plus（414 x 736 pt，5.5 英寸）、X 和 XS（375 x 812 pt，5.8 英寸，实际手握大小跟 6 差不多）、XSMax（414 x 896 pt，6.5 英寸，实际手握大小跟 Plus 差不多）
#define kkFuncIsMatchingSize(width, height) ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(width, height), [kkScreen currentMode].size) : NO)
#define kkIsPhone5         kkFuncIsMatchingSize(640.0, 1136.0)
#define kkIsPhone6         kkFuncIsMatchingSize(750.0, 1334.0)
#define kkIsPhone6Plus     kkFuncIsMatchingSize(1242.0, 2208.0)
#define kkIsPhoneXOrXS     kkFuncIsMatchingSize(1125.0, 2436.0)
#define kkIsPhoneXR        kkFuncIsMatchingSize(828.0, 1792.0)
#define kkIsPhoneXSMax     kkFuncIsMatchingSize(1242.0, 2688.0)
#define kkIsPhoneXModel    (kkIsPhoneXOrXS || kkIsPhoneXR || kkIsPhoneXSMax)
#define kkIsPhoneOldModel  (kkIsPhone6Plus || kkIsPhone6 || kkIsPhone5 || kkIsPhone4)

#pragma mark - 屏幕大小、常用控件高度（状态栏、导航栏、选项卡、HomeBar）
// 屏幕大小
#define kkFrameOfMainScreen  [kkScreen bounds]
#define kkWidthOfMainScreen  kkFrameOfMainScreen.size.width
#define kkHeightOfMainScreen kkFrameOfMainScreen.size.height

#define kkFuncSafeAreaInsets() ({ \
    UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero; \
    if (@available(iOS 11.0, *)) { \
        safeAreaInsets = kkApplication.delegate.window.safeAreaInsets; \
    } \
    (safeAreaInsets); \
}) \

#define kkFuncIsUseSafeArea() ({ \
    BOOL isUseSafeArea = NO; \
    if (@available(iOS 12.0, *)) { \
        isUseSafeArea = YES; \
    } else if (@available(iOS 11.0, *)) { \
        isUseSafeArea = (kkIsPhone && !kkIsPhoneOldModel); \
    } \
    (isUseSafeArea); \
}) \

#define kkHeightOfStatus              (kkFuncIsUseSafeArea() ? kkFuncSafeAreaInsets().top : 20.0)
#define kkHeightOfNavigation          44.0
#define kkHeightOfStatusAndNavigation (kkHeightOfStatus + kkHeightOfNavigation)
#define kkHeightOfHomeBar             (kkFuncIsUseSafeArea() ? kkFuncSafeAreaInsets().bottom : 0.0)
#define kkHeightOfTabContent          49.0
#define kkHeightOfTabBar              (kkHeightOfHomeBar + kkHeightOfTabContent)


#define funcScaleWidth(width) ((width) * (kWidthOfMainScreen / (kIsPad ? 768.0 : 375.0)))
#define funcScaleHeight(height) ((height) * (kHeightOfMainScreen / (kIsPad ? 1024.0 : (kIsPhoneXModel ? 812.0 : 667.0))))

#pragma mark - 颜色
#define kkFuncUIColorFromOxValueA(rgbValue, A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]
#define kkFuncUIColorFromOxValue(rgbValue) kkFuncUIColorFromOxValueA(rgbValue, 1.0)

#define kkFuncUIColorFromRGB(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define kkFuncUIColorFromRGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]



#endif /* KKStyleConfig_h */
