//
//  NSTimer+KKWeakTimer.m
//  xinli001
//
//  Created by ZKKMBP on 2020/5/18.
//  Copyright © 2020 xinli001. All rights reserved.
//

#import "NSTimer+KKWeakTimer.h"

@interface WeakTimerObject : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;

- (void)fire:(NSTimer *)timer;

@end

@implementation WeakTimerObject

- (void)fire:(NSTimer *)timer {
    if (self.target) {
        if ([self.target respondsToSelector:self.selector]) {
            [self.target performSelector:self.selector withObject:timer.userInfo];
        }
    } else{
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end

@implementation NSTimer (KKWeakTimer)

+ (NSTimer *)kk_scheduledWeakTimerWithTimeInterval:(NSTimeInterval)interval
                                            target:(id)target
                                          selector:(SEL)selector
                                          userInfo:(id)userInfo
                                           repeats:(BOOL)repeats {
    WeakTimerObject *object = [[WeakTimerObject alloc] init];
    object.target = target;
    object.selector = selector;
    object.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                    target:object
                                                  selector:@selector(fire:)
                                                  userInfo:userInfo
                                                   repeats:repeats];
    return object.timer;
}
@end

