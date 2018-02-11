//
//  NSLog.h
//  MySchool
//
//  Created by 程远 on 16/10/26.
//  Copyright © 2016年 程远. All rights reserved.
//

//如果有Debug这个宏的话,就允许log输出...可变参数
#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif
