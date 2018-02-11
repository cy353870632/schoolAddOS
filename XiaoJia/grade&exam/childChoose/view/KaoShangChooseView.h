//
//  KaoShangChooseView.h
//  XiaoJia
//
//  Created by 程远 on 17/3/21.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@protocol payKaoShangdelegat <NSObject>

-(void)payKaoShang;
-(void)cancelKaoShang;
@end

@interface KaoShangChooseView : CustomView
@property(strong,nonatomic)UIButton * choose_button;
@property(strong,nonatomic)UIButton * payType_button;
@property(strong,nonatomic)id<payKaoShangdelegat>kaoshangDelegat;
@end
