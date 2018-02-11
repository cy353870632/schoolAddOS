//
//  PersonView.h
//  MySchool
//
//  Created by 程远 on 16/10/18.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "CusTomView.h"

@protocol selectPhoto <NSObject>
-(void)loginOut;
-(void)selectPhoto;
-(void)changeNikeName;
-(void)pushLogin;
-(void)didselectCell:(NSInteger)row;
@end

@interface PersonView : CustomView
@property(strong,nonatomic)UITableView * person_tableview;
@property(strong,nonatomic)UIImageView * person_img;
@property(strong,nonatomic)UILabel * personNmae_label;
@property(strong,nonatomic)NSArray * personLabel_array;
@property(strong,nonatomic)NSArray * personImg_array;
@property(strong,nonatomic)UIButton * getOut_btn;
@property(assign,nonatomic)id<selectPhoto>delegat;
@end
