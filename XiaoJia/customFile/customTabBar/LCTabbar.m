//
//  LCTabbar.m
//  LuoChang
//
//  Created by Rick on 15/4/29.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "LCTabbar.h"
#import "LCTabBarController.h"

@interface LCTabbar()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,shoppingBtnSelectdelegate>
{
    LCTabBarButton *_selectedBarButton;
}
@end

@implementation LCTabbar
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addBarButtons];
        [MSNotificationCenter addObserver:self selector:@selector(tabbarBadgeShow:) name:@"tabbarBadgeShow" object:nil];
        [MSNotificationCenter addObserver:self selector:@selector(tabbarBadgeHidden) name:@"tabbarBadgeHidden" object:nil];
    }
    return self;
}
-(void)tabbarBadgeShow:(NSNotification*)notification{
    NSString * tabbarBadgevalue = [notification object];
    [self.badgeButton setHidden:NO];
    [self.badgeButton setTitle:tabbarBadgevalue forState:UIControlStateNormal];
}
-(void)tabbarBadgeHidden{
    [self.badgeButton setHidden:YES];
    
}
-(void) addBarButtons{
    for (int i = 0 ; i<5 ; i++) {
        LCTabBarButton *btn = [[LCTabBarButton alloc] init];
        CGFloat btnW = self.frame.size.width/5;
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0;
        
        CGFloat btnH = self.frame.size.height-10;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        NSString *imageName = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *selImageName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        NSString *title;
        if (i==0) {
            title = @"成绩";
        }else if(i==1){
            title = @"资讯";
        }else if(i==2){
//            imageName = @"逛逛";
//            selImageName =@"摄影机图标_点击后";
        }else if(i==3){
            title = @"交流";
        }else if(i==4){
            title = @"圈子";
        }
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        btn.tag = i;
       
            [btn setTitle:title forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize: 11.0];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn setTitleColor:[UIColor colorWithRed:0.231 green:0.678 blue:0.050 alpha:1.000] forState:UIControlStateSelected];
            [btn setTitleColor:RGB(128, 128, 128) forState:UIControlStateNormal];
            [self addSubview:btn];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//        [self addSubview:btn];
        
        if(i == 0){
            [self btnClick:btn];
        }
        if (i == 3) {
            self.badgeButton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.badgeButton.frame = CGRectMake(btn.frame.size.width-35, 1, 20, 20);
            self.badgeButton.backgroundColor = [UIColor redColor];
            self.badgeButton.tintColor = [UIColor whiteColor];
            self.badgeButton.layer.cornerRadius = 10;
            self.badgeButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
            
            NSString *tabbarBadgeValue = [MSUserDefaults objectForKey:@"tabbarBadgeValue"];
            if (tabbarBadgeValue == NULL || [tabbarBadgeValue isEqualToString:@"0"]) {
                [self.badgeButton setHidden:YES];
            }else
            {
                [self.badgeButton setHidden:NO];
                [self.badgeButton setTitle:tabbarBadgeValue forState:UIControlStateNormal];
            }
            [btn addSubview:self.badgeButton];
        }
    }
}

-(void)shoppingBtnSelect:(id)sender
{
    [self btnClick:sender];
}
-(void) btnClick:(UIButton *)button{
    if (button.tag!=2) {
        [self.delegate changeNav:_selectedBarButton.tag to:button.tag];
        _selectedBarButton.selected = NO;
        button.selected = YES;
        _selectedBarButton = (LCTabBarButton *)button;
    }else{
        [self.delegate changeNav:_selectedBarButton.tag to:button.tag];
        _selectedBarButton.selected = NO;
        button.selected = YES;
        _selectedBarButton = (LCTabBarButton *)button;
        
    }

}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"点击了 %ld",buttonIndex);
    if (buttonIndex != 2) {
        //        ImageViewController *imageVC = [[ImageViewController alloc]init];
        LCTabBarController *tabVC = (LCTabBarController *)[[UIApplication sharedApplication].delegate window].rootViewController;
        //        [tabVC.selectedViewController.childViewControllers.lastObject  presentViewController:imageVC animated:YES completion:^{}];
        
        UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
        
        if([UIImagePickerController isSourceTypeAvailable:type]){
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
                type = UIImagePickerControllerSourceTypeCamera;
            }
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.allowsEditing = NO;
            picker.delegate   = self;
            picker.sourceType = type;
            
            [tabVC.selectedViewController.childViewControllers.lastObject  presentViewController:picker animated:YES completion:^{
                
            }];
        }
        
        
    }
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"image  %@",image);
    }];
    
}
- (void) dealloc {
    [MSNotificationCenter removeObserver:self];
}
@end
