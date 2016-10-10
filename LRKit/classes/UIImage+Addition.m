//
//  UIImage+CutImage.m
//  MiDou
//
//  Created by 甘 立荣 on 13-7-26.
//  Copyright (c) 2013年 www.midou8.com. All rights reserved.
//

#import "UIImage+Addition.h"

@implementation UIImage (Addition)

- (UIImage*)getSubImage:(CGRect)rect {
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    CGImageRelease(subImageRef);
    return smallImage;
    
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    @autoreleasepool {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
}
@end
