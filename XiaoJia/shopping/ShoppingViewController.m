//
//  RootViewController.m
//  YBExample
//
//  Created by laouhn on 15/11/14.
//  Copyright (c) 2015年 laouhn. All rights reserved.
//

/*
 * 使用的时候只需要引入YBUnlimitedSlideViewController的头文件即可
 */
/*代理方法:
 *1.这个是必须实现的方法,用来返回存储图片的数组
 * - (NSMutableArray *)backDataSourceArray;
 *2.这个是可选实现的方法,返回的ScrollerView的大小
 * - (CGSize)backScrollerViewForWidthAndHeight;
 * 这个是对象方法,如果要实现点击图片进入对应的界面,可以使用这个方法,返回的是当前点击的图片的下标
 * - (NSInteger)backCurrentCilkPicture;
 */

/*
 * 建议子控制器的view大小和ScrollerView的大小一致,不然pageControl的位置会有所偏移
 */


#import "ShoppingViewController.h"
#import "YBUnlimitedSlideViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ShoppingViewController ()<YBUnlimitedSlideViewControllerDelegate,shoppingscrollerViewdelegate>
{
    NSArray * fenleiText_array;
}
@property (nonatomic, strong) YBUnlimitedSlideViewController *unlimitedSlideVC;
@property(strong,nonatomic)ShoppingScrollerView * shoppingScrollerView;
@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"逛逛";
    self.navigationItem.leftBarButtonItem = nil;
    
    //收藏按钮
    UIBarButtonItem * shoucang_rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shoucang_xuanzhong"] style:UIBarButtonItemStyleDone target:self action:@selector(shoucang)];
    [shoucang_rightButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = shoucang_rightButton;
    
    //构建分类按钮个数
    fenleiText_array = [NSArray arrayWithObjects:@"培训计划",@"在线视频",@"辅导材料",@"文体用具",@"课外托管",@"其他", nil];
    self.fenlei_array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 6; i++) {
        NSDictionary * dic = [[NSDictionary alloc] initWithObjects:@[[NSString stringWithFormat:@"%d",i],fenleiText_array[i]] forKeys:@[@"status",@"fenleiName"]];
        [self.fenlei_array addObject:dic];
    }
    
    _unlimitedSlideVC = [[YBUnlimitedSlideViewController alloc]init];
    //如果想添加pageControl,就将其置为YES,不需要的可以不写,或者置为NO
    _unlimitedSlideVC.isPageControl = YES;
    _unlimitedSlideVC.delegate = self;
    //设置子控制器view的frame
    _unlimitedSlideVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth*8/16);
    [self addChildViewController:_unlimitedSlideVC];
    
    [self.view addSubview:self.shoppingScrollerView];
    [self.shoppingScrollerView addSubview:_unlimitedSlideVC.view];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapAction:)];
    [_unlimitedSlideVC.view addGestureRecognizer:tap];
    
    
}

-(void)shoucang{
    NSLog(@"点击了我的收藏");
    ShouCangViewController * shoucangController = [[ShouCangViewController alloc]init];
    [self.navigationController pushViewController:shoucangController animated:YES];
}

- (void)handleTapAction:(UITapGestureRecognizer *)sender{
    
    NSLog(@"逛逛首页 滚动图 第 %ld 张图片",[_unlimitedSlideVC backCurrentCilkPicture]);
    
}


//必须实现的方法,返回要展示的图片数组
- (NSMutableArray *)backDataSourceArray{
    NSArray *array = @[@"haizeiwang1",@"haizeiwang2",@"icon_cat"];
    return [NSMutableArray arrayWithArray:array];
}

//如果不实现,ScrollerView的默认宽是屏幕的宽,高是宽的0.5625倍
- (CGSize)backScrollerViewForWidthAndHeight{

    return CGSizeMake(kScreenWidth,kScreenWidth*8/16);
}
#pragma mark shoppingViewDelegate
-(void)moveShoppingViewToUp
{
    self.shoppingScrollerView.scrollEnabled = YES;
    [UIView animateWithDuration:0.6 animations:^{
        [self.shoppingScrollerView setFrame:CGRectMake(0,-MAINSCREEN.height/2+5, MAINSCREEN.width, MAINSCREEN.height*1.5)];
    }];
    self.shoppingScrollerView.scrollEnabled = NO;
}
-(void)moveShoppingViewToDown
{
    self.shoppingScrollerView.scrollEnabled = YES;
    [UIView animateWithDuration:0.6 animations:^{
        [self.shoppingScrollerView setFrame:self.view.bounds];
    }];
    self.shoppingScrollerView.scrollEnabled = NO;//只有操作tableview的时候才可以移动该页面
}
//逛逛首页分类按钮
-(void)didselectFenLeiButton:(NSInteger *)index
{
    ShoppingFenLeiShowViewController * shoppingFenLeiShowViewController = [[ShoppingFenLeiShowViewController alloc]init];
    shoppingFenLeiShowViewController.index = [NSString stringWithFormat:@"%d",(int)index];
    shoppingFenLeiShowViewController.title_label = [NSString stringWithFormat:@"%@   ▼",fenleiText_array[(int)index]];
    shoppingFenLeiShowViewController.title_array = [[NSMutableArray alloc]init];
    shoppingFenLeiShowViewController.title_array = self.fenlei_array;
    [self.navigationController pushViewController:shoppingFenLeiShowViewController animated:YES];
}



-(ShoppingScrollerView *)shoppingScrollerView
{
    if (!_shoppingScrollerView) {
        _shoppingScrollerView = [[ShoppingScrollerView alloc]initWithFrame:self.view.bounds scrollerViewHight:CGRectGetMaxY(self.unlimitedSlideVC.view.frame) fenleiArray:self.fenlei_array];
        [_shoppingScrollerView setContentSize:CGSizeMake(MAINSCREEN.width, MAINSCREEN.height*1.6)];
        _shoppingScrollerView.shoppingscrollerViewdelegate = self;
        
        _shoppingScrollerView.bounces = NO;
    }
    return _shoppingScrollerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
