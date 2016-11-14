//
//  NSString+MD5Encrypt.h
//  Smile
//
//  Created by 甘 立荣 on 12-11-24.
//  Copyright (c) 2012年 甘 立荣. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>

@interface NSString (MD5)

- (NSString *)md5Encrypt;

@end
