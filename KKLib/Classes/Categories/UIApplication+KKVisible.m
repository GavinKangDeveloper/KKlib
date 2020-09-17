//
//  UIApplication+KKVisible.m
//  ZSHT
//
//  Created by 出神入化 on 2017/11/24.
//  Copyright © 2017年 出神入化. All rights reserved.
//

#import "UIApplication+KKVisible.h"
@implementation UIApplication (KKVisible)


- (UIViewController *)kk_visibleViewController {
    UIViewController *rootViewController = [self.delegate.window rootViewController];
    return [self kk_getVisibleViewControllerFrom:rootViewController];
}

- (UITabBarController *)kk_visibleTabBarViewController {
    
    return (UITabBarController *)[self.delegate.window rootViewController];
}

- (UIViewController *)kk_getVisibleViewControllerFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        if ([[((UINavigationController *) vc) visibleViewController] isKindOfClass:[UIAlertController class]]) {
            return [((UINavigationController *) vc) topViewController];
        } else {
            return [self kk_getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
        }
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self kk_getVisibleViewControllerFrom:[((UITabBarController *) vc)selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self kk_getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}
- (UINavigationController *)kk_visibleNavigationController {
    return [[self kk_visibleViewController] navigationController];
}

@end
