//
//  UIView+Additions.h
//  MiDou
//
//  通过类目扩展UiView的功能,方便的访问和操作他的各个属性
//  Created by 甘 立荣 on 13-3-26.
//  Copyright (c) 2013年 甘 立荣. All rights reserved.
//

#import <UIKit/UIKit.h>

CGPoint LRCGRectGetCenter(CGRect rect);
CGRect  LRCGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (Additions)

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;   //View的X轴
@property CGFloat left;  //View的Y轴


@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
- (UIViewController *)viewController;

@end
