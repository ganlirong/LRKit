//
//  UIColorDefinition.h
//  MiDou
//
//  定义了项目中的所有颜色值
//  Created by 甘立荣 on 14-10-14.
//  Copyright (c) 2014年 www.midou8.com. All rights reserved.
//

#ifndef MiDou_UIColorDefinition_h
#define MiDou_UIColorDefinition_h


//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//带有RGBA的颜色设置
#define COLOR_RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define COLOR_RGB(r,g,b) COLOR_RGBA(r,g,b,1.0f)

//清除背景色
#define CLEAR_COLOR [UIColor clearColor]

//主页分割线
#define HOME_CELL_SEP_LINE_COLOR COLOR_RGB(230, 230, 230)

//----------------------颜色类--------------------------

//定义view的背景色
#define VIEW_COMMON_BG_COLOR COLOR_RGB(240, 240, 240)

//定义小球颜色
#define RedBallRGBColor COLOR_RGB(219, 21, 12) //红色
#define BlueBallRGBColor COLOR_RGB(12, 111, 238) //蓝色

//分割线颜色
#define SEP_LINE_COLOR COLOR_RGB(212, 212, 212)
#define SEP_BLUE_LINE_COLOR COLOR_RGB(0, 150, 225)

//项目的主色调成橙色
#define MAIN_COLOR COLOR_RGB(241, 141, 0)
#define MAIN_FONT_COLOR COLOR_RGB(0, 0, 0)

//定义UILabel中的字体

#define TextRedColor COLOR_RGB(195.0, 24.0, 24.0)
#define TextGreenColor COLOR_RGB(0.0, 120.0, 0.0)

/**
 *  藏青色
 */
#define COLOR_NAVYBLUE COLOR_RGB(0, 153, 153)

/**
 *  球队字体颜色(全黑)
 */
#define MATCH_TEAM_COLOR COLOR_RGB(1, 1, 1)
/**
 *  比赛类型字体颜色(灰色)
 */
#define MATCH_TYPE_COLOR COLOR_RGB(74, 74, 74)
/**
 *  时间字体颜色(红色)
 */
#define MATCH_TIME_COLOR COLOR_RGB(219, 11, 0)
/**
 *  让球数+字体颜色(青色)
 */
#define MATCH_ADD_COLOR COLOR_RGB(0, 153, 51)
/**
 *  让球-字体颜色(蓝色)
 */
#define MATCH_SUB_COLOR COLOR_RGB(15, 118, 222)
/**
 *  半全场,比分,混投按钮字体颜色
 */
#define BQC_BF_HT_SELECTED_COLOR COLOR_RGB(141, 141, 141)
/**
 *  半全场,比分,混投按钮字体颜色
 */
#define COLOR_GRAY_SEPLINE COLOR_RGB(163, 163, 163)
/**
 *  系统默认的蓝色
 */
#define COLOR_BLUE_SYSTEM COLOR_RGB(0, 127, 255)
/**
 *  混投侧边提示蓝色
 */
#define COLOR_BLUE_HUNTOU COLOR_RGB(0, 151, 226)
/**
 *  混投侧边提示绿色
 */
#define COLOR_GREEN_HUNTOU COLOR_RGB(86, 188, 0)

/**
 *  比赛场数颜色
 */
#define MATCH_COUNT_COLOR COLOR_RGB(255,214,51)

/**
 *  红色
 */
#define COLOR_RED_COMMON COLOR_RGB(219,11,0)

/**
 *  红色
 */
#define COLOR_BLACK_COMMON COLOR_RGB(52,52,52)

/**
 *  淡绿色
 */
#define COLOR_ONDINE COLOR_RGB(226,255,211)

/**
 *  粉红色
 */
#define COLOR_PINK COLOR_RGB(255.0,212.0,212.0)

/**
 *  灰色
 */
#define COLOR_GRAY COLOR_RGB(227.0,227.0,227.0)

/**
 *  灰青色
 */
#define COLOR_GRAY_GREEN COLOR_RGB(130,125,91)

#define COLOR_ORANGE COLOR_RGB(246,112,59)

#endif
