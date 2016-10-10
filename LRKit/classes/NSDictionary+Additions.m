//
//  NSDictionary+Additions.m
//  MiDou
//
//  Created by 甘 立荣 on 14-8-8.
//  Copyright (c) 2014年 www.midou8.com. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (id)objectForValue:(id)aValue{
    NSArray *keys = [self allKeys]; //获取字典中所有值
    for (id key in keys) {
        id value = self[key];
        if ([value isEqual:aValue]) {
            return key;
        }
    }
    return nil;

}

@end
