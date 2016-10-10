//
//  NSTimer+Addition.m
//  MiDou
//
//  Created by 甘 立荣 on 14-2-14.
//  Copyright (c) 2014年 www.midou8.com. All rights reserved.
//

#import "NSTimer+Addition.h"

@implementation NSTimer (Addition)

/**
 *  暂停定时器
 */
-(void)pauseTimer{
    
    if (![self isValid]) {
        
        return;
        
    }
    
    [self setFireDate:[NSDate distantFuture]];
    
}

/**
 *  重置定时器
 */
-(void)resumeTimer{
    
    if (![self isValid]) {
        
        return;
        
    }
    
    [self setFireDate:[NSDate date]];
    
}

/**
 *  在N秒后重置
 *
 *  @param interval 延迟时间
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval{
    
    if (![self isValid]) {
        
        return;
        
    }
    
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
    
}

+ (NSTimer *)rc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    block:(void (^) ())block
                                  repeats:(BOOL)repeats{


    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(rc_blockInvoke:)
                                       userInfo:block
                                        repeats:repeats];

}

+ (void)rc_blockInvoke:(NSTimer *)timer{

    void (^block)() = timer.userInfo;
    
    if (block) {
        
        block();
        
    }

}

@end
