//
//  NSDate+Utils.m
//  LunarCalendar
//
//  Created by 甘立荣 on 13-10-4.
//  Copyright (c) 2014年 甘立荣. All rights reserved.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)

- (NSInteger)year {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                              initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSYearCalendarUnit fromDate:self];
    return [components year];
    
}

- (NSInteger)month {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                              initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSMonthCalendarUnit fromDate:self];
    return [components month];
    
}

- (NSInteger)day {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                              initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSDayCalendarUnit fromDate:self];
    return [components day];
    
}

- (NSInteger)hour {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSHourCalendarUnit fromDate:self];
    return [components hour];
    
}

- (NSInteger)weekday {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit fromDate:self];
    return [components weekday];
    
}

- (NSString *)chinaWeekDay {
    
    NSInteger weekday = [self weekday];
    NSString *chinaWeekday = nil;
    
    switch (weekday) {
        case 1:
            chinaWeekday = @"周日";
            break;
        case 2:
            chinaWeekday = @"周一";
            break;
        case 3:
            chinaWeekday = @"周二";
            break;
        case 4:
            chinaWeekday = @"周三";
            break;
        case 5:
            chinaWeekday = @"周四";
            break;
        case 6:
            chinaWeekday = @"周五";
            break;
        case 7:
            chinaWeekday = @"周六";
            break;
            
        default:
            break;
    }
    
    return chinaWeekday;
    
}

+ (NSString *)chinaWeekDay:(NSInteger)weekday{
    
    NSString *chinaWeekday = nil;
    
    switch (weekday) {
        case 7:
            chinaWeekday = @"周日";
            break;
        case 1:
            chinaWeekday = @"周一";
            break;
        case 2:
            chinaWeekday = @"周二";
            break;
        case 3:
            chinaWeekday = @"周三";
            break;
        case 4:
            chinaWeekday = @"周四";
            break;
        case 5:
            chinaWeekday = @"周五";
            break;
        case 6:
            chinaWeekday = @"周六";
            break;
            
        default:
            break;
    }
    
    return chinaWeekday;
    
}

- (NSDate *)tomorrow{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    [components setDay:([components day]+1)];
    
    NSDate *date = [gregorian dateFromComponents:components];
    
    return date;
    
}

- (NSDate *)afterTomorrow{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    [components setDay:([components day]+2)];
    
    NSDate *date = [gregorian dateFromComponents:components];
    
    return date;
    
}

- (NSDate *)yesterday{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    [components setDay:([components day] - 1)];
    
    NSDate *date = [gregorian dateFromComponents:components];
    
    return date;
    
}


- (NSDate *)beforeYesterday{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    [components setDay:([components day] - 2)];
    
    NSDate *date = [gregorian dateFromComponents:components];
    
    return date;
    
}

/**
 *  返回每周的第一天
 *
 *  @return
 */
- (NSInteger)firstWeekDayInMonth {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                              initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //设置星期一为第一天,默认为星期天(1)
    //[gregorian setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"nl_NL"]];
    
    //Set date to first of month
    NSDateComponents *comps = [gregorian components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    [comps setDay:1];
    NSDate *newDate = [gregorian dateFromComponents:comps];
    
    return [gregorian ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:newDate];
    
}

- (NSDate *)offsetMonth:(int)numMonths {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                              initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
    
}

-(NSDate *)offsetHours:(int)hours {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                              initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //星期天为1,星期一为2
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    //[offsetComponents setMonth:numMonths];
    [offsetComponents setHour:hours];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
    
}

-(NSDate *)offsetDay:(int)numDays {
    NSCalendar *gregorian = [[NSCalendar alloc]
                              initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}

/**
 *  获取一个月的天数
 *
 *  @return 
 */
- (NSInteger)numDaysInMonth {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    NSUInteger numberOfDaysInMonth = rng.length;
    return numberOfDaysInMonth;
    
}

+ (NSDate *)dateStartOfDay:(NSDate *)date {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                              initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components =
    [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                           NSDayCalendarUnit) fromDate: date];
    return [gregorian dateFromComponents:components];
    
}

+ (NSDate *)dateStartOfWeek {
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                              initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: - ((([components weekday] - [gregorian firstWeekday])
                                      + 7 ) % 7)];
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:[NSDate date] options:0];
    
    NSDateComponents *componentsStripped = [gregorian components: (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                                        fromDate: beginningOfWeek];
    
    //gestript
    beginningOfWeek = [gregorian dateFromComponents: componentsStripped];
    
    return beginningOfWeek;
    
}

+ (NSDate *)dateEndOfWeek {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    
    
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay: + (((([components weekday] - [gregorian firstWeekday])
                                  + 7 ) % 7))+6];
    NSDate *endOfWeek = [gregorian dateByAddingComponents:componentsToAdd toDate:[NSDate date] options:0];
    
    NSDateComponents *componentsStripped = [gregorian components: (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                                        fromDate: endOfWeek];
    
    //gestript
    endOfWeek = [gregorian dateFromComponents: componentsStripped];
    return endOfWeek;
    
}

/**
 *  日期间隔
 *
 *  @return
 */
- (NSInteger)intervalDate {
    
    NSDate *todayDate = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSDayCalendarUnit
                                           fromDate:todayDate
                                             toDate:self
                                            options:0];
    return [comps day];

}

/**
 *  将一个NSDate格式的日期转换成参数formate格式的string日期
 *
 *  @param date    NSDate格式日期
 *  @param formate 目标格式
 *
 *  @return
 */
- (NSString *)stringDateWithFormate:(NSString *)formate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSString *str = [formatter stringFromDate:self];
    return str;
    
}

/**
 *  将一个字符格式的日期转换成NSDate格式的日期
 *
 *  @param datestring 源字符串格式的日期
 *  @param formate    格式
 *
 *  @return NSDate格式的日期
 */
+ (NSDate *)dateWithString:(NSString *)datestring formate:(NSString *)formate {
    
    if (datestring) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [formatter setDateFormat:formate];
        NSDate *date = [formatter dateFromString:datestring];
        return date;
    }
    
    return nil;
    
}

/**
 *  将一个服务器返回的格式yyyyMMddHHmmss 转换成 Aug 1, 2013 7:40:00 PM格式
 *
 *  @param datestring
 *
 *  @return
 */
+ (NSDate *)dateWithString:(NSString *)datestring {
    
    if (datestring != nil) {
        NSString *formate = @"yyyyMMddHHmmss";
        NSDate *createDate = [NSDate dateWithString:datestring formate:formate];
        return createDate;
    }
    
    return nil;
    
}

/**
 *  将服务器返回的yyyyMMddHHmmss格式的日期转换为yyyy-MM-dd格式的日期
 *
 *  @param datestring
 *
 *  @return
 */
+ (NSString *)stringDateWithString:(NSString *)dateString {
    
     if (dateString) {
    
         NSString *formate = @"yyyyMMddHHmmss";
         NSDate *createDate = [NSDate dateWithString:dateString formate:formate];
         return [createDate stringDateWithFormate:@"yyyy-MM-dd"];
         
     }
    
    return nil;
    
}


/**
 *  将服务器返回的yyyyMMddHHmmss格式的日期转换为yyyy-MM-dd HH:mm:ss格式的日期
 *
 *  @param datestring
 *
 *  @return
 */
+ (NSString *)stringFromServerWithString:(NSString *)dateString {
    
    NSString *formate = @"yyyyMMddHHmmss";
    NSDate *createDate = [NSDate dateWithString:dateString formate:formate];
    return [createDate stringDateWithFormate:@"yyyy-MM-dd HH:mm"];
    
}

/**
 *  将一个字符串格式的日期转换为其他字符串格式的日期
 *
 *  @param sourceDete    源日期
 *  @param sourceFormate 源格式
 *  @param targetFormate 目标格式
 *
 *  @return 返回目标字符串日期
 */
+ (NSString *)stringWithString:(NSString *)sourceDete
                 sourceFormate:(NSString *)sourceFormate
                 targetFormate:(NSString *)targetFormate{
    
    if (sourceDete) {
        NSDate *createDate = [NSDate dateWithString:sourceDete formate:sourceFormate];
        return [createDate stringDateWithFormate:targetFormate];
    }
    
    return nil;
    
}

/**
 *  将时间格式从UTC转换成GMT时间格式,解决打印时间相差八小时的情况
 *
 *  @param date
 *
 *  @return
 */
- (NSDate *)convertToLocalDate{
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: self];
    NSDate *localeDate = [self dateByAddingTimeInterval: interval];
    return localeDate;
    
}

/**
 *  判断一个日期是否当天
 *
 *  @param
 *
 *  @return
 */

- (BOOL)isToday {
        
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *someDate = [cal dateFromComponents:components];
    return [today isEqualToDate:someDate] ? YES : NO;
    
}

/**
 *  是否明天
 *
 *  @return
 */
- (BOOL)isTomorrow {
    
    NSDate *date = [NSDate date];
    NSDate *tomorrow = [date tomorrow];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *someDate = [cal dateFromComponents:components];
    
    return [tomorrow isEqualToDate:someDate] ? YES : NO;
    
}

/**
 *  判断一个时间是否是另外一个时间的明天
 *
 *  @param target 目标时间
 *
 *  @return
 */
- (BOOL)isTomorrowWithComparison:(NSString *)comparison{
    
    NSDate *targetDate = [NSDate dateWithString:comparison];
    NSDate *tomorrow = [targetDate tomorrow];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *someDate = [cal dateFromComponents:components];
    
    return [tomorrow isEqualToDate:someDate] ? YES : NO;
    
}

/**
 *  是否后天
 *
 *  @return
 */
- (BOOL)isAfterTomorrow{
    
    NSDate *date = [NSDate date];
    NSDate *afterTomorrow = [date afterTomorrow];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *someDate = [cal dateFromComponents:components];
    
    return [afterTomorrow isEqualToDate:someDate] ? YES : NO;
    
}

/**
 *  判断一个时间是否是另外一个时间的后天
 *
 *  @param target 目标时间
 *
 *  @return
 */
- (BOOL)isAfterTomorrowWithComparison:(NSString *)comparison{
    
    NSDate *targetDate = [NSDate dateWithString:comparison];
    NSDate *afterTomorrow = [targetDate afterTomorrow];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *someDate = [cal dateFromComponents:components];
    
    return [afterTomorrow isEqualToDate:someDate] ? YES : NO;
    
}

/**
 *  是否昨天
 *
 *  @return
 */
- (BOOL)isYesterDay{
    
    NSDate *date = [NSDate date];
    NSDate *yesterday = [date yesterday];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *someDate = [cal dateFromComponents:components];
    
    return [yesterday isEqualToDate:someDate] ? YES : NO;
    
}

/**
 *  判断一个时间是否是另外一个时间的昨天
 *
 *  @param target 目标时间
 *
 *  @return
 */
- (BOOL)isYesterDayWithComparison:(NSString *)comparison{
    
    NSDate *targetDate = [NSDate dateWithString:comparison];
    NSDate *yesterday = [targetDate yesterday];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *someDate = [cal dateFromComponents:components];
    
    return [yesterday isEqualToDate:someDate] ? YES : NO;
    
}

/**
 *  是否前天
 *
 *  @return
 */
- (BOOL)isBeforeYesterday{
    
    NSDate *date = [NSDate date];
    NSDate *beforeYesterday = [date beforeYesterday];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *someDate = [cal dateFromComponents:components];
    
    return [beforeYesterday isEqualToDate:someDate] ? YES : NO;
    
}

/**
 *  判断一个时间是否是另外一个时间的前天
 *
 *  @param target 目标时间
 *
 *  @return
 */
- (BOOL)isBeforeYesterdayWithComparison:(NSString *)comparison{
    
    NSDate *targetDate = [NSDate dateWithString:comparison];
    NSDate *beforeYesterday = [targetDate beforeYesterday];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *someDate = [cal dateFromComponents:components];
    
    return [beforeYesterday isEqualToDate:someDate] ? YES : NO;
    
}


+ (NSString *) formateIssueDateWithString:(NSString *)dateStr sysTime:(NSString *)sysTime{

    NSDate *endTime = [NSDate dateWithString:dateStr];
    NSString *dayStr = [endTime dayStringWithComparison:sysTime];
    dateStr = [endTime stringDateWithFormate:@"(E) HH:mm"];
    dateStr = [dateStr stringByReplacingOccurrencesOfString:@"星期" withString:@"周"];
    dateStr = [NSString stringWithFormat:@"%@ %@", dayStr, dateStr];
    
    return dateStr;

}

- (NSString *)dayStringWithComparison:(NSString *)comparison{
    
    NSString *dayStr;

    if ([self isToday]) {
        
        dayStr = @"今天";
        
    } else if ([self isTomorrowWithComparison:comparison]) {
    
        dayStr = @"明天";
    
    } else if ([self isAfterTomorrowWithComparison:comparison]) {
    
        dayStr = @"后天";
    
    } else if ([self isYesterDayWithComparison:comparison]) {
        
        dayStr = @"昨天";
        
    } else if ([self isBeforeYesterdayWithComparison:comparison]) {
        
        dayStr = @"前天";
        
    } else {
    
        dayStr = [self stringDateWithFormate:@"MM-dd"];
    
    }
    
    return dayStr;

}

@end
