//
//  NSTimer+Addition.h
//  MiDou
//
//  Created by 甘 立荣 on 14-2-14.
//  Copyright (c) 2014年 www.midou8.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

/**
 *  暂停定时器
 */
- (void)pauseTimer;

/**
 *  重置定时器
 */
- (void)resumeTimer;

/**
 *  在N秒后重置
 *
 *  @param interval 延迟时间
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

/**
 *  自定义定时器防止内存泄露
 *
 *  @param interval <#interval description#>
 *  @param block    <#block description#>
 *  @param repeats  <#repeats description#>
 */
+ (NSTimer *)rc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    block:(void (^) ())block
                                  repeats:(BOOL)repeats;

@end
