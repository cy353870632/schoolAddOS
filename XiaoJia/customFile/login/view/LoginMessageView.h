//
//  LoginMessageView.h
//  XiaoJia
//
//  Created by 程远 on 17/5/3.
//  Copyright © 2017年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCountDownButton.h"
@protocol LoginMessageViewDelegat <NSObject>
-(void)didBackButon;
@end
@interface LoginMessageView : UIView
@property(strong,nonatomic)UIButton * back_button;
@property(strong,nonatomic)UILabel * type_label;
@property(strong,nonatomic)UIButton * forget_label;
@property(strong,nonatomic)UILabel * uid_label;
@property(strong,nonatomic)UILabel * passWord_label;
@property(strong,nonatomic)UITextField * uid_field;
@property(strong,nonatomic)UITextField * passWord_field;
@property(strong,nonatomic)UIButton * enter_button;
@property(strong,nonatomic)UIButton * register_button;
@property(strong,nonatomic)UIButton * callUs_button;
@property(strong,nonatomic)UIButton * writeUs_button;
@property(strong,nonatomic)NSString * typeStatus;
@property(strong,nonatomic)JKCountDownButton * countDownCode;
@property(strong,nonatomic)id<LoginMessageViewDelegat>delegat;
@end
