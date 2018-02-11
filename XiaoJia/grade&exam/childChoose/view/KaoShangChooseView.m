//
//  KaoShangChooseView.m
//  XiaoJia
//
//  Created by 程远 on 17/3/21.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "KaoShangChooseView.h"

@implementation KaoShangChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray * money_array = [NSArray arrayWithObjects:@"2元",@"4元",@"6元",@"10元", nil];
        NSArray * type_array = [NSArray arrayWithObjects:@"支付宝",@"微信", nil];
        UIButton * button[4];
        for (int i = 0; i < 4; i++) {
            button[i] = [UIButton buttonWithType:UIButtonTypeCustom];
            if (i < 2) {
                button[i].frame = CGRectMake( MAINSCREEN.width/2.55*i+40, 30, MAINSCREEN.width/4, 30);
            }
            else
            {
                    button[i].frame = CGRectMake( MAINSCREEN.width/2.55*(i-2)+40, 70, MAINSCREEN.width/4, 30);
            }
            [button[i] setTitle:money_array[i] forState:UIControlStateNormal];
            if (i == 3) {
                [button[i] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                button[i].backgroundColor = blue_color;
                self.choose_button = button[i];
            }else
            {
                [button[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                button[i].backgroundColor = [UIColor whiteColor];
            }
        
            button[i].layer.borderColor = blue_color.CGColor;
            button[i].layer.borderWidth = 1;
            [button[i] addTarget:self action:@selector(chooseMoney:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button[i]];
        }
        
        UILabel * payType_label = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.choose_button.frame)+10, 70, 20)];
        payType_label.text = @"支付方式:";
        payType_label.font = [UIFont systemFontOfSize:12];
        [self addSubview:payType_label];
        
        //支付方式
        UIButton * paytype_button[2];
        for (int i = 0; i < 2; i++) {
            paytype_button[i] = [UIButton buttonWithType:UIButtonTypeCustom];
            paytype_button[i].frame = CGRectMake(CGRectGetMaxX(payType_label.frame)+3+110*i, CGRectGetMaxY(self.choose_button.frame)+20, 80, 30);
            
            [paytype_button[i] setTitle:type_array[i] forState:UIControlStateNormal];
            if (i == 0) {
                [paytype_button[i] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                paytype_button[i].backgroundColor = blue_color;
                self.payType_button = paytype_button[i];
            }else
            {
                [paytype_button[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                paytype_button[i].backgroundColor = [UIColor whiteColor];
            }
            
            paytype_button[i].layer.borderColor = blue_color.CGColor;
            paytype_button[i].layer.borderWidth = 1;
//            [button[i] addTarget:self action:@selector(chooseMoney:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:paytype_button[i]];
        }

        
        //确认，取消
        UIButton * enter_button[2];
        for (int i = 0; i < 2; i++) {
            enter_button[i] = [UIButton buttonWithType:UIButtonTypeCustom];
            enter_button[i].frame = CGRectMake(MAINSCREEN.width/2.7*i+30, CGRectGetMaxY(self.payType_button.frame)+20, MAINSCREEN.width/3.5, 30);
            if (i == 0) {
                enter_button[i].tintColor = [UIColor whiteColor];
                enter_button[i].backgroundColor = blue_color;
                [enter_button[i] setTitle:@"确认支付" forState:UIControlStateNormal];
            }else
            {
                [enter_button[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                enter_button[i].backgroundColor = [UIColor whiteColor];
                [enter_button[i] setTitle:@"取消" forState:UIControlStateNormal];
            }
            enter_button[i].tag = i;
            enter_button[i].layer.borderColor = blue_color.CGColor;
            enter_button[i].layer.borderWidth = 1;
            [enter_button[i] addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:enter_button[i]];
        }
        
    }
    return self;
}
-(void)chooseMoney:(id)sender
{
    UIButton * button = sender;
    button.tintColor = [UIColor whiteColor];
    button.backgroundColor = blue_color;
    [self.choose_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.choose_button.backgroundColor = [UIColor whiteColor];
    self.choose_button = button;
}

-(void)enter:(id)sender
{
    UIButton * button = sender;
    if (button.tag == 1) {
        [self.kaoshangDelegat cancelKaoShang];
    }else
    {
        [self.kaoshangDelegat payKaoShang];
    }
}

@end
