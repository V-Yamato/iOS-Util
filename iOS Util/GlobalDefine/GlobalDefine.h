//
//  GlobalDefine.h
//  Fighting
//
//  Created by 黄聪 on 16/8/17.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#ifndef GlobalDefine_h
#define GlobalDefine_h

//app版本
#define BundleVersion @"3.0"
//各种三方key
#define GDMapKey @"64a7faf5eb626cea773f883f75db910e"

//字符串
#define IsNilString(__String) (__String==nil || [__String isEqualToString:@""]|| [__String isEqualToString:@"<null>"]|| [__String isEqualToString:@"(null)"])
#define DLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)

//iphone设备判断
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)

#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

//宽高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)*1.00

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)*1.00

#define IndexBannerCellHeight 90/568.00*SCREEN_HEIGHT

#define IndexLessonCellHeight 70/568.00*SCREEN_HEIGHT

#define SessionCellHeight 60/568.00*SCREEN_HEIGHT

#endif /* GlobalDefine_h */
