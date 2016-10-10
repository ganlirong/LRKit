//
//  NSArray+Additions.m
//  LotteryUtils
//
//  Created by 甘立荣 on 8/24/16.
//  Copyright © 2016 甘立荣. All rights reserved.
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)

- (NSString *)joinWithCharacter:(NSString *)character {
    NSMutableString *resultString = [NSMutableString string];
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        NSString *object = self[i];
        BOOL isStringOrNumber = [object isKindOfClass:[NSString class]] ||
        [object isKindOfClass:[NSNumber class]];
        NSAssert(isStringOrNumber, @"数组内元素必须为NSString或者NSNumber类型");
        if ([object isKindOfClass:[NSNumber class]]) {
            object = [NSString stringWithFormat:@"%@", object];
        }
        [resultString appendString:object];
        if (i != count - 1) {
            [resultString appendString:character];
        }
    }
    return resultString;
}

@end
