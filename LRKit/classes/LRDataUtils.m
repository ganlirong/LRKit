//
//  UIUtils.m
//  MiDou 
//
//
//  Created by 甘 立荣 on 12-12-22.
//  Copyright (c) 2013年 甘 立荣. All rights reserved.
//

#import "LRDataUtils.h"
#import "RegexKitLite.h"
#import <CommonCrypto/CommonDigest.h>

@implementation LRDataUtils

/**
 *  获取document路径
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDocumentsPath:(NSString *)fileName {
    
    //两种获取document路径的方式
    //NSString *documents = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *path = [documents stringByAppendingPathComponent:fileName];
    return path;
    
}

//从配置文件中读取常量
+ (NSString *)getConstant:(NSString *)constKey {
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CONSTANTS" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSString *constValue = [dic objectForKey:constKey];
    return constValue;
    
}

//匹配邮箱地址
+ (BOOL)checkEmail:(NSString *)email{
    NSString *regex = @"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b";
    return [email isMatchedByRegex:regex];
}

//匹配手机号
+ (BOOL)checkPhone:(NSString *)phoneNum {
    NSString *regex = @"^1[34578]\\d{9}$";
    return [phoneNum isMatchedByRegex:regex];
}

+ (BOOL)checkNumber:(NSString *)string {
    NSString *regex = @"^[0-9]*$";
    return [string isMatchedByRegex:regex];
}

//匹配中文
+ (BOOL)checkChinese:(NSString *)string {
    NSString *regex = @"[\u2e80-\u9fff]$";
    return [string isMatchedByRegex:regex];
}

/**
 *  匹配数字
 *
 *  @param string 数字
 *
 *  @return BOOL
 */
+ (BOOL)isInt:(NSString *)string {
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

//计算字符里面汉字个数
+ (NSInteger)checkChineseCount:(NSString *)string {
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < string.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *character = [string substringWithRange:range];
        if ([self checkChinese:character]) {
            [array addObject:character];
        }
    }
    return array.count;
    
}

//匹配字母,数字,中文的字符串
+ (BOOL)checkNickname:(NSString *)string {
    NSString *regex = @"^[\u4e00-\u9fa5_a-zA-Z0-9]+$";
    return [string isMatchedByRegex:regex];
}

//用*号代替用户个人敏感信息
+ (NSString *)replaceBySign:(NSString *)string location:(NSInteger)location length:(NSInteger)length {
    
    NSRange range;
    NSInteger compare = string.length - location;
    if (compare >= length) {
        NSString *newString = string;
        for (int i = 0; i < length ; i++) {
            range.location = i + location;
            range.length = 1;
            newString = [newString stringByReplacingCharactersInRange:range withString:@"*"];
        }
        return newString;
    }
    return nil;
    
}

//处理后台发过来得金额,数字加千位分隔符
+ (NSString *)formatterMoney:(NSNumber *)money {
    
    if (money != nil && ![money isKindOfClass: [NSNull class]] ) {
        double moneyDouble = [money doubleValue]/100; //后台金额单位为分
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        NSNumber *moneyNumber = [NSNumber numberWithDouble:moneyDouble];
        NSString *moneyString = [numberFormatter stringFromNumber:moneyNumber];
        moneyString = [moneyString stringByReplacingOccurrencesOfString:@"$" withString:@""];
        moneyString = [moneyString stringByReplacingOccurrencesOfString:@"￥" withString:@""];
        moneyString = [NSString stringWithFormat:@"%@元", moneyString];
        return moneyString;
    }
    
    return nil;
    
}

//处理后台发过来得金额,数字加千位分隔符
+ (NSString *)formatterMoneyNotUnit:(NSNumber *)money {
    
    if (money != nil && ![money isKindOfClass: [NSNull class]] ) {
        double moneyDouble = [money doubleValue]; //后台金额单位为分
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        NSNumber *moneyNumber = [NSNumber numberWithDouble:moneyDouble];
        NSString *moneyString = [numberFormatter stringFromNumber:moneyNumber];
        moneyString = [moneyString stringByReplacingOccurrencesOfString:@"$" withString:@""];
        moneyString = [moneyString stringByReplacingOccurrencesOfString:@"￥" withString:@""];
        moneyString = [moneyString substringToIndex:moneyString.length - 3];
        return moneyString;
    }
    return nil;
    
}

//处理后台发过来得金额,数字加千位分隔符
+ (NSString *)formatterMoneyNoPonit:(NSNumber *)money {
    if (money != nil && ![money isKindOfClass: [NSNull class]] ) {
        double moneyDouble = [money doubleValue]/100; //后台金额单位为分
        NSString *moneyString = [NSString stringWithFormat:@"%.0f元", moneyDouble];
        return moneyString;
    }
    return nil;
    
}

//处理后台发过来得金额,数字加千位分隔符
+ (NSString *)formatterChinaMoney:(NSNumber *)money {
    
    NSString *moneyString;
    
    if (money != nil && ![money isKindOfClass: [NSNull class]] ) {
        double moneyDouble = [money doubleValue]; //后台金额单位为分
        if (moneyDouble >= 1000000 && moneyDouble < 100000000) {
            moneyDouble = moneyDouble/1000000;
            moneyDouble = round(moneyDouble*100)/100;
            moneyString = [NSString stringWithFormat:@"%.2f万元", moneyDouble];
        } else if (moneyDouble >= 100000000 && moneyDouble < 1000000000) {
            moneyDouble = moneyDouble/1000000;
            moneyDouble = round(moneyDouble*100)/100;
            moneyString = [NSString stringWithFormat:@"%.0f万元", moneyDouble];
        } else if (moneyDouble >= 1000000000) {
            moneyDouble = moneyDouble/1000000;
            moneyDouble = round(moneyDouble*100)/100;
            moneyString = [NSString stringWithFormat:@"%.0f万元", moneyDouble];
        }
    }
    
    return moneyString;
    
}


int checkIDfromchar (const char *sPaperId) {
    
    long lSumQT = 0;
    int R[] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 }; //加权因子
    char sChecker[11] = {'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'}; //校验码
    if( 18 != strlen(sPaperId)) {
        return 0; //检验长度
    }
    //校验数字
    for (int i = 0; i < 18; i++) {
        if ( !isdigit(sPaperId[i]) && !(('X' == sPaperId[i] || 'x' == sPaperId[i]) && 17 == i) ) {
            return 0;
        }
    } //验证最末的校验码
    
    for (int i = 0; i <= 16; i++) {
        lSumQT += (sPaperId[i] - 48)*R[i];
    }
    
    if (sChecker[lSumQT%11] != sPaperId[17]) {
        return 0;
    }
    
    return 1;
}

+ (BOOL)checkIDCard:(NSString *)str {
    return checkIDfromchar((char *)[str UTF8String]);
}

+ (NSString *)objectToJSONWithObject:(id)object {
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *string = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return string;
    
}

+ (id)JSONToObjectWithJSON:(NSString *)string {
    NSError *error = nil;
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    id object = [NSJSONSerialization JSONObjectWithData:stringData
                                                options:NSJSONReadingMutableContainers
                                                  error:&error];
    return object;
}


+ (void)saveCacheData:(id)cacheArray cacheType:(NSString *)cacheType {
    NSUserDefaults *defaults  = [NSUserDefaults standardUserDefaults];
    [defaults setObject:cacheArray forKey:cacheType];
    [defaults synchronize];
}

+ (id)cacheDataWithCacheType:(NSString *)cacheType {
    
    NSUserDefaults *defaults  = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:cacheType];
    
}


/**
 *  清除小数点，例如,.00,.50
 *
 *  @return NSString
 */
+ (NSString *)deleteZeroDecimalWithDoubleValue:(double)doubleValue {
    
    double money = (round(doubleValue * 100)/100);
    NSString *moneyStr = [NSString stringWithFormat:@"%.2f", money];
    //驱除小数点，例如,.00,.50
    NSString *decimalFirstStr = [moneyStr substringWithRange:NSMakeRange(moneyStr.length - 2, 1)];
    NSString *decimalLastStr = [moneyStr substringWithRange:NSMakeRange(moneyStr.length - 1, 1)];
    
    if ([decimalLastStr isEqualToString:@"0"]) {
        if ([decimalFirstStr isEqualToString:@"0"]) {
            moneyStr = [moneyStr substringWithRange:NSMakeRange(0, moneyStr.length - 3)];
        } else {
            moneyStr = [moneyStr substringWithRange:NSMakeRange(0, moneyStr.length - 1)];
        }
    }
    
    return moneyStr;
    
}

/**
 *  变成两位小数点
 *
 *  @return 格式化之后的string
 */
+ (NSString *)twoDecimalWithDoubleValue:(double)doubleValue {
    
    double money = (round(doubleValue * 100)/100);
    NSString *moneyStr = [NSString stringWithFormat:@"%.2f", money];
    
    return moneyStr;
    
}

/**
 *  判断是否第一次登录
 *
 *  @return BOOL
 */
+ (BOOL)appIsFirstTimeLaunch {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *flag = [defaults objectForKey:@"kAPP_IS_FIRST_TIME_RUN"];
    return flag == nil;
}

/**
 *  判断是否第一次登录
 *
 *  @return BOOL
 */
+ (BOOL)appIsFirstTimeLaunchAndInit {
    
    if ([self appIsFirstTimeLaunch]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"kAPP_IS_FIRST_TIME_RUN" forKey:@"kAPP_IS_FIRST_TIME_RUN"];
        return YES;
    } else {
        return NO;
    }
}


@end
