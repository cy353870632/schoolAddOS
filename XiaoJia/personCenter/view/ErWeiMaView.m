//
//  ErWeiMaView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/12.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ErWeiMaView.h"

@implementation ErWeiMaView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView * erweima_img = [[UIImageView alloc]initWithFrame:CGRectMake(40, 40, MAINSCREEN.width/2,  MAINSCREEN.width/2)];
        [erweima_img setImage:[UIImage imageNamed:@"icon_Qrcode"]];
        [self addSubview:erweima_img];
        
    }
    return self;
}
@end
