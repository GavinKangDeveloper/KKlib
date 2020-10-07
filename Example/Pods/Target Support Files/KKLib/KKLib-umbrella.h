#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSString+KKTools.h"
#import "NSTimer+KKWeakTimer.h"
#import "UIApplication+KKVisible.h"
#import "UIControl+KKClickInterval.h"
#import "UIImage+KKTools.h"
#import "UIImageView+KKTools.h"
#import "UILabel+KKTools.h"
#import "UIView+KKTools.h"
#import "KKStyleConfig.h"
#import "KKToolConfig.h"
#import "KKDevice.h"

FOUNDATION_EXPORT double KKLibVersionNumber;
FOUNDATION_EXPORT const unsigned char KKLibVersionString[];

