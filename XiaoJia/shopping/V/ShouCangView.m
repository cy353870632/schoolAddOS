//
//  ShouCangView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/20.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ShouCangView.h"
@interface ShouCangView()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton * tableChoosestatus_button;
}
@property(strong,nonatomic)ShoppingTableViewCell * cell;
@end
@implementation ShouCangView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.shopping_array  = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < 15; i++) {
            NSDictionary * dic = @{@"title":[NSString stringWithFormat:@"%d条培训计划",i]
                                   ,@"description":@"三里屯培训学校"
                                   ,@"price":[NSString stringWithFormat:@"%d00",i+1]
                                   ,@"time":@"40课时"
                                   ,@"joinAndComment":@"100人报名    65人已评论"
                                   ,@"oneClassTime":@"／课时"
                                   ,@"unitPrice":[NSString stringWithFormat:@"%d0",i+1]
                                   };
            [self.shopping_array addObject:dic];
        }
        
        UIButton * tableChoose_button[4];
        NSArray * fenleiText_array = [[NSArray alloc]initWithObjects:@"培训方案",@"在线视屏",@"教辅书材", @"更多",nil];
        for (int i = 0; i < fenleiText_array.count; i++) {
            tableChoose_button[i] = [UIButton buttonWithType:UIButtonTypeSystem];
            tableChoose_button[i].frame = CGRectMake(MAINSCREEN.width/4*i, MAINSCREEN.height/11,MAINSCREEN.width/4, 30);
            [tableChoose_button[i] setTitle:fenleiText_array[i] forState:UIControlStateNormal];
            tableChoose_button[i].tag = i;
            tableChoose_button[i].layer.borderColor = blue_color.CGColor	;
            tableChoose_button[i].layer.borderWidth = 1;
            
            if (i == 0) {
                tableChoose_button[i].tintColor = blue_color;
                tableChoosestatus_button = tableChoose_button[i];
            }else
            {
                tableChoose_button[i].tintColor = [UIColor grayColor];
                
            }
            [tableChoose_button[i] addTarget:self action:@selector(fenleibuttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:tableChoose_button[i]];
        }
        [self addSubview:self.peixun_tableView];
    }
    return self;
}
-(void)fenleibuttonClick:(id)sender
{
    tableChoosestatus_button.tintColor= [UIColor grayColor];
    UIButton * button = sender;
    tableChoosestatus_button = button;
    button.tintColor= blue_color;
    NSLog(@"收藏页的  %@",button.titleLabel.text);
}
#pragma mark tableView代理方法
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
    [_cell.shoucang_button setImage:[UIImage imageNamed:@"shoucang_xuanzhong"] forState:UIControlStateNormal];
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
        _peixun_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tableChoosestatus_button.frame), MAINSCREEN.width, MAINSCREEN.height-64) style:UITableViewStyleGrouped];
        _peixun_tableView.delegate = self;
        _peixun_tableView.dataSource = self;
        [_peixun_tableView setSectionFooterHeight:10];
        _peixun_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _peixun_tableView.showsVerticalScrollIndicator = NO;
    }
    return _peixun_tableView;
}
@end
