//
//  NSTimer+KKWeakTimer.h
//  xinli001
//
//  Created by ZKKMBP on 2020/5/18.
//  Copyright © 2020 xinli001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (KKWeakTimer)
+ (NSTimer *)kk_scheduledWeakTimerWithTimeInterval:(NSTimeInterval)interval
                                            target:(id)target
                                          selector:(SEL)selector
                                          userInfo:(id)userInfo
                                           repeats:(BOOL)repeats;

@end
