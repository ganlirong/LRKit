//
//  BaseModel.h
//  MiDou
//  所有对象实体的基类

//  Created by 甘立荣 on 12-12-22.
//  Copyright (c) 2013年 www.midou8.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject <NSCoding>{

}

//字典转成对象
-(id)initWithDataDic:(NSDictionary*)data;
- (NSDictionary*)attributeMapDictionary;
- (void)setAttributes:(NSDictionary*)dataDic;
- (NSString *)customDescription;
- (NSString *)description;
- (NSData*)getArchivedData;

- (NSString *)cleanString:(NSString *)str;    //清除\n和\r的字符串

@end
