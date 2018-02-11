//
//  PeiXunViewForGradeView.m
//  XiaoJia
//
//  Created by 程远 on 17/3/16.
//  Copyright © 2017年 程远. All rights reserved.
//将首页的培训推荐部分单独来写

#import "PeiXunViewForGradeView.h"
@interface PeiXunViewForGradeView()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton * status_button;
}
@property(strong,nonatomic)ShoppingTableViewCell * cell;
@end
@implementation PeiXunViewForGradeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton * fenlei_button[4];
        NSArray * fenleiText_array = [[NSArray alloc]initWithObjects:@"培训方案",@"在线视屏",@"教辅书材", @"更多",nil];
        for (int i = 0; i < fenleiText_array.count; i++) {
            fenlei_button[i] = [UIButton buttonWithType:UIButtonTypeSystem];
            fenlei_button[i].frame = CGRectMake(MAINSCREEN.width/4*i, 0,MAINSCREEN.width/4, 30);
            [fenlei_button[i] setTitle:fenleiText_array[i] forState:UIControlStateNormal];
            fenlei_button[i].tag = i;
            fenlei_button[i].layer.borderColor = blue_color.CGColor	;
            fenlei_button[i].layer.borderWidth = 1;
            
            if (i == 0) {
                fenlei_button[i].tintColor = blue_color;
                status_button = fenlei_button[i];
            }else
            {
            fenlei_button[i].tintColor = [UIColor grayColor];
            }
            [fenlei_button[i] addTarget:self action:@selector(fenleibuttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:fenlei_button[i]];
        }
        [self addSubview:self.peixun_tableView];
    }
    return self;
}
-(void)fenleibuttonClick:(id)sender
{
    status_button.tintColor= [UIColor grayColor];
    UIButton * button = sender;
    status_button = button;
    button.tintColor= blue_color;
    NSLog(@"%@",button.titleLabel.text);
}

//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return 0.001;
}
//指定有多少个section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.shopping_array.count;
    
}
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    _cell = [[ShoppingTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    [_cell.layer setCornerRadius:10];
    [_cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [_cell.photo_img setImage:[UIImage imageNamed:@"haizeiwang2"]];
    _cell.title_label.text = self.shopping_array[indexPath.section][@"title"];
    _cell.description_label.text = self.shopping_array[indexPath.section][@"description"];
    _cell.price_label.text = self.shopping_array[indexPath.section][@"price"];
    _cell.time_label.text = self.shopping_array[indexPath.section][@"time"];
    _cell.joinAndComment_label.text = self.shopping_array[indexPath.section][@"joinAndComment"];
    _cell.oneClassTime_label.text = self.shopping_array[indexPath.section][@"oneClassTime"];
    _cell.unitPrice_label.text = self.shopping_array[indexPath.section][@"unitPrice"];
    return _cell;
    
}

//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

        return MAINSCREEN.height/5+10;
    
    
}

//点击每个分区执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




#pragma mark 控件加载
-(UITableView *)peixun_tableView
{
    if (!_peixun_tableView) {
        _peixun_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(status_button.frame)+2, MAINSCREEN.width, MAINSCREEN.height/5*3+10) style:UITableViewStyleGrouped];
        _peixun_tableView.delegate = self;
        _peixun_tableView.dataSource = self;
        [_peixun_tableView setSectionFooterHeight:10];
        _peixun_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        NSLog(@"%@",self.shopping_array);
        _peixun_tableView.showsVerticalScrollIndicator = NO;
    }
    return _peixun_tableView;
}

@end
