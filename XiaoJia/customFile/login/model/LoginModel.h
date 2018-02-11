//
//  LoginModel.h
//  XiaoJia
//
//  Created by 程远 on 17/5/15.
//  Copyright © 2017年 程远. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^goodsInfo)(NSDictionary * info);
@interface LoginModel : NSObject
+(void)loginRequestSuccess:(goodsInfo)block;

@end
