//
//  UIUtils.h
//  MiDou  
//
//
//  Created by 甘 立荣 on 12-12-22.
//  Copyright (c) 2013年 甘 立荣. All rights reserved.
//
//  时间操作工具类 mark_by_gan
//

#import <Foundation/Foundation.h>

@interface LRDataUtils : NSObject

/**
 *  获取document路径
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDocumentsPath:(NSString *)fileName;

/**
 *  从配置文件中读取常量
 *
 *  @param constKey <#constKey description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)getConstant:(NSString *)constKey;
/**
 *  匹配邮箱
 *
 *  @param email 邮箱地址
 *
 *  @return BOOL
 */
+ (BOOL)checkEmail:(NSString *)email;

/**
 *  匹配身份证号
 *
 *  @param str 身份证
 *
 *  @return BOOL
 */
+ (BOOL)checkIDCard:(NSString *)str;

/**
 *  匹配手机号
 *
 *  @param phoneNum 手机号
 *
 *  @return BOOL
 */
+ (BOOL)checkPhone:(NSString *)phoneNum;

/**
 *  匹配
 *
 *  @param string 字符创
 *
 *  @return BOOL
 */
+ (BOOL)checkNumber:(NSString *)string;

/**
 *  匹配中文
 *
 *  @param string 中文字符串
 *
 *  @return BOOL
 */
+ (BOOL)checkChinese:(NSString *)string;

/**
 *  匹配数字
 *
 *  @param string string
 *
 *  @return BOOL
 */
+ (BOOL)isInt:(NSString *)string;


/**
 *  检查中文数量
 *
 *  @param string 字符串
 *
 *  @return BOOL
 */
+ (NSInteger)checkChineseCount:(NSString *)string;


/**
 *  用*号代替敏感信息
 *
 *  @param string   所要代替的目标string对象
 *  @param location 起始索引
 *  @param length   长度
 *
 *  @return 格式化之后字符串
 */
+ (NSString *)replaceBySign:(NSString *)string location:(NSInteger)location length:(NSInteger)length;

/**
 *  数字加千位分隔符
 *
 *  @param money 金额字符串
 *
 *  @return 格式化之后的金额
 */
+ (NSString *)formatterMoney:(NSNumber *)money;
+ (NSString *)formatterMoneyNotUnit:(NSNumber *)money;
+ (NSString *)formatterChinaMoney:(NSNumber *)money;
+ (NSString *)formatterMoneyNoPonit:(NSNumber *)money;

/**
 *  将对象转换成JSON格式的数据
 *
 *  @param object NSObject对象
 *
 *  @return 返回NSString对象
 */
+ (NSString *)objectToJSONWithObject:(id)object;

/**
 *  将JSONString转换成数组或者字典对象
 *
 *  @param string json字符串
 *
 *  @return 返回对象
 */
+ (id)JSONToObjectWithJSON:(NSString *)string;

/**
 *  app第一次是否启动,如果是第一次则置为非第一次启动
 *
 *  @return <#return value description#>
 */
+ (BOOL)appIsFirstTimeLaunchAndInit;

/**
 *  app是否第一次登录
 *
 *  @return 是否第一次启动
 */
+ (BOOL)appIsFirstTimeLaunch;

/**
 *  清除小数点，例如,.00,.50
 *
 *  @return string
 */
+ (NSString *)deleteZeroDecimalWithDoubleValue:(double)doubleValue;

/**
 *  变成两位小数点
 *
 *  @return string
 */
+ (NSString *)twoDecimalWithDoubleValue:(double)doubleValue;

+ (void)saveCacheData:(id)cacheArray cacheType:(NSString *)cacheType;
+ (id)cacheDataWithCacheType:(NSString *)cacheType;
    
@end
