//
//  NSData+Base64.h
//  RSA
//
//  Created by 甘立荣 on 13-6-20.
//  Copyright (c) 2013年 www.szhelper.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)

+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;
@end
