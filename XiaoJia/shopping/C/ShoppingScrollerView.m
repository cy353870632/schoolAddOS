//
//  ShoppingScrollerView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/1.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ShoppingScrollerView.h"

@interface ShoppingScrollerView()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton * tableChoosestatus_button;
    UIButton * fenleistatus_button;
    NSInteger lastContentOffset;
}
@property(strong,nonatomic)ShoppingTableViewCell * cell;
@end

@implementation ShoppingScrollerView

- (instancetype)initWithFrame:(CGRect)frame scrollerViewHight:(NSInteger)hight fenleiArray:(NSMutableArray *)fenleiArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.fenlei_array  = [[NSMutableArray alloc]init];
        self.fenlei_array = fenleiArray;
        [self initUI:hight];
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
        [self addSubview:self.peixun_tableView];
    }
    return self;
}
-(void)fenleiButton:(id)sender
{
    UIButton * button = sender;
    NSLog(@"点击了   逛逛首页分类按钮");
    [self.shoppingscrollerViewdelegate didselectFenLeiButton:button.tag];
}

-(void)fenleibuttonClick:(id)sender
{
    tableChoosestatus_button.tintColor= [UIColor grayColor];
    UIButton * button = sender;
    tableChoosestatus_button = button;
    button.tintColor= blue_color;
    NSLog(@"%@",button.titleLabel.text);
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
    return _cell;
    
}

//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return MAINSCREEN.height/5 +10;
    
    
}

//点击每个分区执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//判断tableview滑动方向
-(void)scrollViewWillBeginDragging:(UIScrollView*)scrollView{
    lastContentOffset = scrollView.contentOffset.y;
}
-( void )scrollViewDidScroll:( UIScrollView *)scrollView {
    if (scrollView.contentOffset.y<0 || scrollView.contentOffset.y==0)
    {
        //向上
        NSLog(@"向上滑动");
        NSLog(@"%f",scrollView.contentOffset.y);
        [self.shoppingscrollerViewdelegate moveShoppingViewToDown];
    } else if (scrollView. contentOffset.y >lastContentOffset )
    {
        //向下
        NSLog(@"向下滑动");
        [self.shoppingscrollerViewdelegate moveShoppingViewToUp];
    }
}
-(void)scrollerViewMoveTo
{
//    [self setContentOffset:CGPointMake(0,CGRectGetMinY(tableChoosestatus_button.frame)) animated:YES];
//    self.bouncesZoom = NO;
    
}
#pragma mark 控件加载
-(UITableView *)peixun_tableView
{
    if (!_peixun_tableView) {
        _peixun_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tableChoosestatus_button.frame)+2, MAINSCREEN.width, MAINSCREEN.height-64) style:UITableViewStyleGrouped];
        _peixun_tableView.delegate = self;
        _peixun_tableView.dataSource = self;
        [_peixun_tableView setSectionFooterHeight:10];
        _peixun_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        NSLog(@"%@",self.shopping_array);
        _peixun_tableView.showsVerticalScrollIndicator = NO;
    }
    return _peixun_tableView;
}


-(void)initUI:(NSInteger)hight{
    UIButton * fenlei_button[self.fenlei_array.count];
    for (int i = 0; i < self.fenlei_array.count; i++) {
        fenlei_button[i] = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i < 3) {
            fenlei_button[i].frame = CGRectMake(MAINSCREEN.width/12+MAINSCREEN.width/3*i,hight+5, MAINSCREEN.width/6, MAINSCREEN.width/6);
        }
        else{
            fenlei_button[i].frame = CGRectMake(MAINSCREEN.width/12+MAINSCREEN.width/3*(i-3),hight+10+MAINSCREEN.width/6, MAINSCREEN.width/6, MAINSCREEN.width/6);
            fenleistatus_button = fenlei_button[i];
        }
        fenlei_button[i].tag = i;
        fenlei_button[i].layer.cornerRadius =MAINSCREEN.width/12;
        UIImage * back_img = [UIImage imageNamed:@"icon_hearImg"];
        //原图展示
        back_img = [back_img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [fenlei_button[i] setImage:back_img forState:UIControlStateNormal];
        [self addSubview:fenlei_button[i]];
        [fenlei_button[i] addTarget:self action:@selector(fenleiButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIButton * tableChoose_button[4];
    NSArray * fenleiText_array = [[NSArray alloc]initWithObjects:@"培训方案",@"在线视屏",@"教辅书材", @"更多",nil];
    for (int i = 0; i < fenleiText_array.count; i++) {
        tableChoose_button[i] = [UIButton buttonWithType:UIButtonTypeSystem];
        tableChoose_button[i].frame = CGRectMake(MAINSCREEN.width/4*i, CGRectGetMaxY(fenleistatus_button.frame)+3,MAINSCREEN.width/4, 30);
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
}
@end
