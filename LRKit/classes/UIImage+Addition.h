//
//  UIImage+CutImage.h
//  MiDou
//
//  截取图片
//  Created by 甘 立荣 on 13-7-26.
//  Copyright (c) 2013年 www.midou8.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)

- (UIImage*)getSubImage:(CGRect)rect;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
