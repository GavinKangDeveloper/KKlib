//
//  UIControl+ClickInterval.h
//  DemoYiXinLi
//
//  Created by kangkang zhu on 2020/4/28.
//  Copyright © 2020 KangkangZhu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (KKClickInterval)
/// 点击事件响应的时间间隔
@property (nonatomic, assign) NSTimeInterval clickInterval;
+ (void)kk_exchangeClickMethod;
@end

NS_ASSUME_NONNULL_END
