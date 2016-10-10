//
//  GlobalUICommon.m
//  MiDou
//
//  Created by 甘 立荣 on 12-12-11.
//  Copyright (c) 2013年 甘 立荣. All rights reserved.
//

#import "GlobalUICommon.h"
#import <sys/utsname.h>

const CGFloat kDefaultRowHeight                  = 44;

const CGFloat kDefaultPortraitToolbarHeight      = 44;
const CGFloat kDefaultLandscapeToolbarHeight     = 33;

const CGFloat kDefaultPortraitKeyboardHeight     = 216;
const CGFloat kDefaultLandscapeKeyboardHeight    = 160;
const CGFloat kDefaultPadPortraitKeyboardHeight  = 264;
const CGFloat kDefaultPadLandscapeKeyboardHeight = 352;

const CGFloat kDefaultNavigationBarHeight        = 44;
const CGFloat kDefaultStatusBarHeight            = 20;
const CGFloat kDefaultTabBarHeight               = 49;
const CGFloat kDefaultOriginalY                  = 64;

const CGFloat kGroupedTableCellInset             = 9;
const CGFloat kGroupedPadTableCellInset          = 42;

const CGFloat kDefaulransitionDuration           = 0.3;
const CGFloat kDefaultFasransitionDuration       = 0.2;
const CGFloat kDefaultFlipTransitionDuration     = 0.7;


NSString * DeviceModel() {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"AT&T iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6S";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6S Plus";
    //iPod
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch Second Generation";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch Third Generation";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch Fourth Generation";
    if ([deviceString isEqualToString:@"iPod7,1"])      return @"iPod Touch 6th Generation";
    //iPad
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (3G)";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini (3G)";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini (WiFi)";
    
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL IsKeyboardVisible() {
    // Operates on the assumption that the keyboard is visible if and only if there is a first
    // responder; i.e. a control responding to key events
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    return ![window isFirstResponder];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL IsPhoneSupported() {
    NSString* deviceType = [UIDevice currentDevice].model;
    return [deviceType isEqualToString:@"iPhone"];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL IsPad() {
#ifdef __IPHONE_3_2
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
#else
    return NO;
#endif
}


///////////////////////////////////////////////////////////////////////////////////////////////////
UIDeviceOrientation DeviceOrientation() {
    UIDeviceOrientation orient = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationUnknown == orient) {
        return UIDeviceOrientationPortrait;
        
    } else {
        return orient;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL IsSupportedOrientation(UIInterfaceOrientation orientation) {
    if (IsPad()) {
        return YES;
        
    } else {
        switch (orientation) {
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:
                return YES;
            default:
                return NO;
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGAffineTransform RotateTransformForOrientation(UIInterfaceOrientation orientation) {
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        return CGAffineTransformMakeRotation(M_PI*1.5);
        
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return CGAffineTransformMakeRotation(M_PI/2);
        
    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        return CGAffineTransformMakeRotation(-M_PI);
        
    } else {
        return CGAffineTransformIdentity;
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////

CGRect ApplicationBounds()
{
    return [UIScreen mainScreen].bounds;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect ApplicationFrame() {
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    return CGRectMake(0, 0, frame.size.width, frame.size.height);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat ToolbarHeightForOrientation(UIInterfaceOrientation orientation) {
    if (UIInterfaceOrientationIsPortrait(orientation) || IsPad()) {
        return ROW_HEIGHT;
        
    } else {
        return LANDSCAPE_TOOLBAR_HEIGHT;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat KeyboardHeightForOrientation(UIInterfaceOrientation orientation) {
    if (IsPad()) {
        return UIInterfaceOrientationIsPortrait(orientation) ? IPAD_KEYBOARD_HEIGHT
        : IPAD_LANDSCAPE_KEYBOARD_HEIGHT;
        
    } else {
        return UIInterfaceOrientationIsPortrait(orientation) ? KEYBOARD_HEIGHT
        : LANDSCAPE_KEYBOARD_HEIGHT;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat GroupedTableCellInset() {
    return IsPad() ? kGroupedPadTableCellInset : kGroupedTableCellInset;
}


