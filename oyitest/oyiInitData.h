//
//  oyiInitData.h
//  第一个产品1.0
//
//  Created by xyl on 14-5-23.
//  Copyright (c) 2014年 com.zc.test. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OYISubViewType)
{
    OYISubViewTypeTop       = 0,
    OYISubViewTypeLeft      = 1,
    OYISubViewTypeRight     = 2,
    OYISubViewTypeBottom    = 3,
    OYISubViewTypeThirdMenu = 4,
} NS_ENUM_AVAILABLE_IOS(6_0);

typedef NS_ENUM(NSInteger, OYIMenuType) {
    OYIMenuTypeNomal      = 0
};

typedef NS_ENUM(NSInteger, OYIWarnType) {
    OYIWarnTypeSucceed      = 0,
    OYIWarnTypeFailed       = 1,
    OYIWarnTypeOther        = 2,
};

typedef NS_ENUM(NSInteger, OYIViewsType) {
    OYIViewsTypeLocal      = 0,
    OYIViewsTypeRul        = 1,
    OYIViewsTypeLab        = 2,
} NS_ENUM_AVAILABLE_IOS(6_0);

@interface oyiInitData : NSObject

/*===============================================================================
 模块功能说明：服务器地址
 =================================================================================*/
#define mainUrl @"http://192.168.1.105:80/cakephp_rest/"
//#define mainUrl @"http://182.92.77.193:8081/medical/"

/*===============================================================================
 模块功能说明：
 =================================================================================*/
//手机屏幕大小
#define Screen_height [[UIScreen mainScreen] bounds].size.height
#define Screen_width [[UIScreen mainScreen] bounds].size.width

//ios版本号
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//状态栏高度
#define StatusBar_height 64.0
#define StatusBar_h 22.0
#define NavigationBar_h 44.0
#define Tabbar_h 44.0

//登录画面
#define WAITING_SECOND 3.0f //等待时间

//导航图片高度
#define IMG_HEIGHT 100

//按钮大小
#define btnWidth 200
#define btnHeight 88

//缩略图尺寸
#define picX 5.0
#define picY
#define picW 60
#define picH 60

//三角弧度
#define hudu 3.1415926 / 12
#define R 170

//角色代码
#define js 2
/*shareSDK*/
#define Appkey @"337001c8f5a2"
#define App_Secret @"588ff454e6d4befcd267f46c8978eeab"

@end
