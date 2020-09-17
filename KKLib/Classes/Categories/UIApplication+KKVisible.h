//
//  UIApplication+KKVisible.h
//  ZSHT
//
//  Created by 出神入化 on 2017/11/24.
//  Copyright © 2017年 出神入化. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (KKVisible)

- (UINavigationController *)kk_visibleNavigationController;

- (UITabBarController *)kk_visibleTabBarViewController;

- (UIViewController *)kk_visibleViewController;
@end
