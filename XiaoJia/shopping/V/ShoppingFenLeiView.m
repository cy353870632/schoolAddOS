//
//  ShoppingFenLeiView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/6.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ShoppingFenLeiView.h"

@interface ShoppingFenLeiView()<UITableViewDelegate,UITableViewDataSource,GrayBackgroundViewDeleget>
{
    UIButton * chooseType_button;
    int shaixuanNumber;//筛选的行数，数据请求
    int status;//标记筛选按钮
}
@property(strong,nonatomic)ShoppingTableViewCell * cell;
@property(strong,nonatomic)ShaiXuanTiaoJianTableViewCell * shaixuanCell;
@property(strong,nonatomic)GrayBackgroundView * grayBackgroundView;
@end

@implementation ShoppingFenLeiView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        shaixuanNumber = 4;
        [self initUI];
        self.shopping_array  = [[NSMutableArray alloc]init];
        for (int i = 0; i < 15; i++) {
            NSDictionary * dic = @{@"title":[NSString stringWithFormat:@"%d条培训计划",i]
                                   ,@"description":@"三里屯培训学校"
                                   ,@"price":[NSString stringWithFormat:@"%d00 元",i+1]
                                   ,@"time":@"40课时"
                                   ,@"joinAndComment":@"100人报名    65人已评论"
                                   ,@"oneClassTime":@"／课时"
                                   ,@"unitPrice":[NSString stringWithFormat:@"%d0",i+1]
                                   };
            [self.shopping_array addObject:dic];
            [self addSubview:self.peixun_tableView];
            [self addSubview:self.grayBackgroundView];
            [self addSubview:self.shaixuan_tableView];
        }
        
    }
    return self;
}
-(void)initUI{
    UIButton * Choose_button[3];
    NSArray * fenleiText_array = [[NSArray alloc]initWithObjects:@"价格",@"距离",@"其他",nil];
    for (int i = 0; i < fenleiText_array.count; i++) {
        Choose_button[i] = [UIButton buttonWithType:UIButtonTypeSystem];
        Choose_button[i].frame = CGRectMake(MAINSCREEN.width/3*i, 0,MAINSCREEN.width/3, 30);
        [Choose_button[i] setTitle:fenleiText_array[i] forState:UIControlStateNormal];
        Choose_button[i].tag = i;
        Choose_button[i].layer.borderColor = blue_color.CGColor	;
        Choose_button[i].layer.borderWidth = 1;
        
        if (i == 0) {
            Choose_button[i].tintColor = blue_color;
            chooseType_button = Choose_button[i];
            status = 0;
        }else
        {
            Choose_button[i].tintColor = [UIColor grayColor];
            
        }
        [Choose_button[i] addTarget:self action:@selector(chooseTypeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:Choose_button[i]];
    }

}
#pragma mark tableView代理方法
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        if (section == 0) {
            return 10;
        }
    }else
    {
        if (section == 0) {
            return 5;
        }
    }
    

    return 0.001;
}
//指定有多少个section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 1) {
        return self.shopping_array.count;
    }else
    {
        return 4;
    }
    
}
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 1;
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
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
    }else
    {
        _shaixuanCell = [[ShaiXuanTiaoJianTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        _shaixuanCell.label.font = [UIFont fontWithName:@"Helvetica" size:14];
        _shaixuanCell.label.text = @"hahahahahaha";
        return _shaixuanCell;
    }
    
    
}

//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        return MAINSCREEN.height/5 +10;
    }else
    {
        return 30;
    }
    
    
    
}

//点击每个分区执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView.tag == 1) {
        NSLog(@"点击了浏览数据的跳转");
    }else{
        if (status == 0) {
            NSLog(@"价格筛选");
        }else if(status == 1){
            NSLog(@"距离筛选");
        }
        else{
            NSLog(@"综合筛选");
        }
        [self didselectGrayBackGroundView];
    }
}

//筛选按钮点击
-(void)chooseTypeBtnClick:(id)sender
{
    
    UIButton * button = sender;
    button.tintColor = blue_color;
    chooseType_button.tintColor = [UIColor grayColor];
    chooseType_button = button;
    status = (int)button.tag;
    [UIView animateWithDuration:0.6 animations:^{
        _grayBackgroundView.hidden = NO;
        [self.shaixuan_tableView setFrame:CGRectMake(0, CGRectGetMaxY(chooseType_button.frame)+2, MAINSCREEN.width,30*shaixuanNumber+20)];
    }];
}

#pragma mark 控件加载
-(UITableView *)peixun_tableView
{
    if (!_peixun_tableView) {
        _peixun_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(chooseType_button.frame), MAINSCREEN.width, MAINSCREEN.height-64) style:UITableViewStyleGrouped];
        _peixun_tableView.delegate = self;
        _peixun_tableView.dataSource = self;
        [_peixun_tableView setSectionFooterHeight:10];
        _peixun_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        NSLog(@"%@",self.shopping_array);
        _peixun_tableView.showsVerticalScrollIndicator = NO;
        _peixun_tableView.tag = 1;
    }
    return _peixun_tableView;
}
-(UITableView *)shaixuan_tableView
{
    if (!_shaixuan_tableView) {
        _shaixuan_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(chooseType_button.frame)+2, MAINSCREEN.width,0.0001) style:UITableViewStyleGrouped];
        _shaixuan_tableView.delegate = self;
        _shaixuan_tableView.dataSource = self;
        [_shaixuan_tableView setSectionFooterHeight:1];
        _shaixuan_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _shaixuan_tableView.showsVerticalScrollIndicator = NO;
        _shaixuan_tableView.tag = 2;
        
    }
    return _shaixuan_tableView;
}
-(GrayBackgroundView *)grayBackgroundView
{
    if (!_grayBackgroundView) {
        _grayBackgroundView = [[GrayBackgroundView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(chooseType_button.frame)+2, MAINSCREEN.width, MAINSCREEN.height)];
        _grayBackgroundView.hidden = YES;
        _grayBackgroundView.deleget = self;
    }
    return _grayBackgroundView;
}
//点击灰色背景view,上拉筛选
-(void)didselectGrayBackGroundView
{
    [UIView animateWithDuration:0.6 animations:^{
        _grayBackgroundView.hidden = YES;
        [self.shaixuan_tableView setFrame:CGRectMake(0, CGRectGetMaxY(chooseType_button.frame)+2, MAINSCREEN.width,0.0001)];
    }];
}
@end
