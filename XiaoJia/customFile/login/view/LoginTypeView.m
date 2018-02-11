//
//  LoginTypeView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/30.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "LoginTypeView.h"

@interface LoginTypeView()
{
    UIButton * status_button;//点击了哪个typebutton
}
@end


@implementation LoginTypeView

- (instancetype)initWithFrame:(CGRect)frame LogoHeight:(NSInteger)height
{
    self = [super initWithFrame:frame];
//    self.backgroundColor = [UIColor redColor];
    if (self) {
        UIButton * button[4];
        NSArray * butttonImg_Array = [NSArray arrayWithObjects:@"chat_more_icons_camera",@"chat_more_icons_file", @"chat_more_icons_photo", @"chat_more_icons_video", nil];
        for (int i = 0; i<4; i++) {
            button[i] = [UIButton buttonWithType:UIButtonTypeSystem];
            if (i == 0|| i == 2) {
                button[i].frame = CGRectMake(MAINSCREEN.width/2-MAINSCREEN.width/8-MAINSCREEN.width/6, 30+MAINSCREEN.height/11*((i-2)+2), MAINSCREEN.width/6, MAINSCREEN.width/6);
                
            }else
            {
                button[i].frame = CGRectMake(MAINSCREEN.width/2+MAINSCREEN.width/8, 30+MAINSCREEN.height/11*((i-3)+2), MAINSCREEN.width/6, MAINSCREEN.width/6);
            }
            button[i].layer.cornerRadius = MAINSCREEN.width/12;
            UIImage * buttonImg = [UIImage imageNamed:butttonImg_Array[i]];
            [button[i] setTag:i];
            buttonImg = [buttonImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [button[i] setImage:buttonImg forState:UIControlStateNormal];
            button[i].clipsToBounds = YES;
            [button[i] addTarget:self action:@selector(LoginClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button[i]];
         
        }
        
    }
    return self;
}

-(void)LoginClick:(id)sender
{
    UIButton * button = sender;
    [self.delegat didselect:button.tag];
    if (button.tag == 0) {
        NSLog(@"家长登录");
        
    }else if (button.tag == 1){
        NSLog(@"教师登录");
    }
    else if (button.tag == 2){
        NSLog(@"商户登录");
    }
    else if (button.tag == 3){
        NSLog(@"联系我们");
    }
}
@end
