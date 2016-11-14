//
//  GlobalUICommon.h
//  MiDou
//
//  项目中经常使用的常量
//  Created by 甘 立荣 on 12-12-11.
//  Copyright (c) 2013年 甘 立荣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ROW_HEIGHT                 kDefaultRowHeight                        //默认的cell的高度
#define TOOLBAR_HEIGHT             kDefaultPortraitToolbarHeight            //纵向工具栏的高度
#define LANDSCAPE_TOOLBAR_HEIGHT   kDefaultLandscapeToolbarHeight           //横向工具栏高度

#define KEYBOARD_HEIGHT                 kDefaultPortraitKeyboardHeight
#define LANDSCAPE_KEYBOARD_HEIGHT       kDefaultLandscapeKeyboardHeight
#define IPAD_KEYBOARD_HEIGHT            kDefaultPadPortraitKeyboardHeight
#define IPAD_LANDSCAPE_KEYBOARD_HEIGHT  kDefaultPadLandscapeKeyboardHeight

#define NAVIGATIONBAR_HEIGHT            kDefaultNavigationBarHeight             //NavBar高度
#define STATUSBAR_HEIGHT                kDefaultStatusBarHeight                 //statusBar高度
#define TABBAR_HEIGHT                   kDefaultTabBarHeight                    //tabBar高度
#define ORIGINAL_Y                      kDefaultOriginalY    //NavigationBar_HEIGHT + StatusBar_HEIGHT


/**
 * @返回手机型号
 */
NSString * DeviceModel();

/**
 * @返回YES 键盘是可视化的
 */
BOOL IsKeyboardVisible();

/**
 * @返回YES，设备支持iPhone
 */
BOOL IsPhoneSupported();

/**
 * @返回YES，设备是iPad
 */
BOOL IsPad();

/**
 * @返回当前设备方向
 */
UIDeviceOrientation DeviceOrientation();

/**
 * 在iPhone/iPad touch上
 * 检查如果屏幕是portrait, landscape left, or landscape right.
 * 这个方法帮你忽略home按钮朝上的方向
 *
 * 在iPad上，一直返回YES
 */
BOOL IsSupportedOrientation(UIInterfaceOrientation orientation);

/**
 * @指定方法返回旋转的transform
 */
CGAffineTransform RotateTransformForOrientation(UIInterfaceOrientation orientation);

/**
 * @返回应用程序物理屏幕大小,可根据屏幕长度判别iphone的型号
 *
 */
CGRect ApplicationBounds();

/**
 * @返回应用程序去掉状态栏高度的大小
 *
 */
CGRect ApplicationFrame();

/**
 * @返回指定方向toolBar的高度
 *
 */
CGFloat ToolbarHeightForOrientation(UIInterfaceOrientation orientation);

/**
 * @ 返回指定方向的键盘的高度
 */
CGFloat KeyboardHeightForOrientation(UIInterfaceOrientation orientation);

/**
 * @ 返回分组表格视图cell与屏幕之间的间距，iPad的间距会更大
 */
CGFloat GroupedTableCellInset();

///////////////////////////////////////////////////////////////////////////////////////////////////
// Dimensions of common iPhone OS Views

/**
 * 标准的tableview行高
 * @const 44 pixels
 */
extern const CGFloat kDefaultRowHeight;

/**
 * 标准的toolBar竖屏的高度The standard height of a toolbar in portrait orientation.
 * @const 44 pixels
 */
extern const CGFloat kDefaultPortraitToolbarHeight;

/**
 * 标准的toolBar横屏的高度 
 * @const 33 pixels
 */
extern const CGFloat kDefaultLandscapeToolbarHeight;

/**
 * 标准的键盘竖屏的高度
 * @const 216 pixels
 */
extern const CGFloat kDefaultPortraitKeyboardHeight;

/**
 * 标准的键盘横屏的高度
 * @const 160 pixels
 */
extern const CGFloat kDefaultLandscapeKeyboardHeight;

/**
 * 分组的表格视图cell边界与屏幕的间距
 * @const 10 pixels
 */
extern const CGFloat kGroupedTableCellInset;

/**
 * 标准的导航栏的高度
 * @const 44 pixels
 */
extern const CGFloat kDefaultNavigationBarHeight;

/**
 * 标准的状态栏的高度
 * @const 20 pixels
 */
extern const CGFloat kDefaultStatusBarHeight;

/**
 * 标准的标签栏的竖屏高度
 * @const 49 pixels
 */
extern const CGFloat kDefaultTabBarHeight;

/**
 * IOS下导航栏的高度
 * @const 49 pixels
 */
extern const CGFloat kDefaultOriginalY;
