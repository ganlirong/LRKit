//
//  NSDate+Utils.h
//  LunarCalendar
//
//  Created by 甘立荣 on 13-10-4.
//  Copyright (c) 2014年 甘立荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)

- (NSInteger)intervalDate;
- (NSDate *)offsetMonth:(int)numMonths;
- (NSDate *)offsetDay:(int)numDays;
- (NSDate *)offsetHours:(int)hours;
- (NSInteger)numDaysInMonth;
- (NSInteger)firstWeekDayInMonth;
- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;
- (NSInteger)weekday;
- (NSInteger)hour;
- (NSDate *)tomorrow;
- (NSDate *)afterTomorrow;
- (NSDate *)yesterday;
- (NSDate *)beforeYesterday;
- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isAfterTomorrow;
- (BOOL)isYesterDay;
- (BOOL)isBeforeYesterday;
- (BOOL)isTomorrowWithComparison:(NSString *)comparison;
- (BOOL)isAfterTomorrowWithComparison:(NSString *)comparison;
- (BOOL)isYesterDayWithComparison:(NSString *)comparison;
- (BOOL)isBeforeYesterdayWithComparison:(NSString *)comparison;
- (NSString *)chinaWeekDay;
+ (NSString *)chinaWeekDay:(NSInteger)weekday;
+ (NSDate *)dateStartOfDay:(NSDate *)date;
+ (NSDate *)dateStartOfWeek;
+ (NSDate *)dateEndOfWeek;
- (NSString *)stringDateWithFormate:(NSString *)formate;
+ (NSDate *)dateWithString:(NSString *)datestring formate:(NSString *)formate;
+ (NSDate *)dateWithString:(NSString *)datestring;
+ (NSString *)stringDateWithString:(NSString *)dateString;
+ (NSString *)stringFromServerWithString:(NSString *)dateString;
+ (NSString *)stringWithString:(NSString *)sourceDete
                 sourceFormate:(NSString *)sourceFormate
                 targetFormate:(NSString *)targetFormate;
- (NSDate *)convertToLocalDate;
+ (NSString *)formateIssueDateWithString:(NSString *)dateStr sysTime:(NSString *)sysTime;

@end
