//
//  GradeExamViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/2/22.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "GradeExamViewController.h"
#import "LCTabbar.h"
@interface GradeExamViewController ()<childChooseDeleget,GrayBackgroundViewDeleget,selectPhoto,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,didselectWYChartdeleget,UIAlertViewDelegate,BasicsMessageViewdelegat,StudentBingDingControllerDelegat>
{
    UIActionSheet * sheet;
    NSMutableArray * childName_array;
}
@property(strong,nonatomic)PersonView * person_view;
@property(strong,nonatomic)UIButton * teacherSuggest_button;
@property(strong,nonatomic)GrayBackgroundView * grayBackgroundView1;
@property(strong,nonatomic)ChildChooseView * childChooseView;
@property(strong,nonatomic)GrayBackgroundView * grayBackgroundView;
@property(strong,nonatomic)GradeView * gradeView;//成绩view
@property(strong,nonatomic)UIAlertView *alert;//修改昵称
@end

@implementation GradeExamViewController
//-(void)viewWillAppear:(BOOL)animated
//{
//    [self.gradeView show];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.title_Button;
    //作业按钮
    UIBarButtonItem * homeWork_rightButton = [[UIBarButtonItem alloc]initWithTitle:@"作业" style:UIBarButtonItemStyleDone target:self action:@selector(homework_Cliek)];
    [homeWork_rightButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = homeWork_rightButton;
    //隐藏返回按钮
    UIBarButtonItem * personCenterButtonItem= [[UIBarButtonItem alloc]initWithCustomView:self.person_btn];
    [self.navigationItem setLeftBarButtonItem:personCenterButtonItem];
    //先添加成绩view
    [self.view addSubview:self.gradeView];
    
    
    [self.view addSubview:self.teacherSuggest_button];
    [self.view addSubview:self.grayBackgroundView];
    //学生姓名数组
    childName_array =[[NSMutableArray alloc]initWithObjects:@"小明",@"小花",@"刘洋洋", nil];
    [self.view addSubview:self.childChooseView];
    _alert = [[UIAlertView alloc] initWithTitle:@"修改昵称" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [_alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    UITextField *txtName = [_alert textFieldAtIndex:0];
    txtName.placeholder = @"请输入名称";
    
    self.person_view.frame = CGRectMake(-MAINSCREEN.width-50, 0, MAINSCREEN.width-50, MAINSCREEN.height);
    self.grayBackgroundView1.frame = CGRectMake(-MAINSCREEN.width-50, 0, MAINSCREEN.width-50, MAINSCREEN.height);
    //在顶层view上添加，出现在所有页面的最上层
    if ([[UIApplication sharedApplication].keyWindow.subviews containsObject:self.grayBackgroundView1] && [[UIApplication sharedApplication].keyWindow.subviews containsObject:self.person_view]) {
        
    }else
    {
        [[UIApplication sharedApplication].keyWindow addSubview:self.grayBackgroundView1];
        [[UIApplication sharedApplication].keyWindow addSubview:self.person_view];
        [[UIApplication sharedApplication].keyWindow addSubview:self.alert];
    }
    
    
    
}

/**
 *加载事件
 */
-(void)titleClick{
    NSLog(@"选择学生");
    if (self.childChooseView.frame.origin.y == CGRectGetMaxY(self.navigationController.navigationBar.frame)) {
        [self didselectGrayBackGroundView];
    }else
    {
    //滚动条的动画显示
    [UIView animateWithDuration:0.6 animations:^{
        [self.childChooseView setFrame:CGRectMake(MAINSCREEN.width/3,CGRectGetMaxY(self.navigationController.navigationBar.frame),MAINSCREEN.width-MAINSCREEN.width/1.5,150)];
        self.grayBackgroundView.hidden = NO;
     
    }];
    }
}
//修改昵称
-(void)changeNikeName
{
[self.alert show];
}
//修改昵称框
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        UITextField *txt = [alertView textFieldAtIndex:0];
        self.person_view.personNmae_label.text = txt.text;
        NSLog(@"%@",txt.text);
    }
    
    
}
-(void)homework_Cliek
{
    HomeWorkViewController * homeWorkViewController = [[HomeWorkViewController alloc]init];
    [self.navigationController pushViewController:homeWorkViewController animated:YES];
}
/**
 *实现代理方法
 */
-(void)chooseChild:(NSInteger)childIndexPath
{
    NSLog(@"点击了选择学生title按钮");
    NSLog(@"%@",childName_array[childIndexPath]);
    [self.title_Button setTitle:[NSString stringWithFormat:@"%@ ▼",childName_array[childIndexPath]] forState:UIControlStateNormal];
    [self didselectGrayBackGroundView];

}
-(void)addChild
{
    NSLog(@"新增小孩");
}
-(void)didselectGrayBackGroundView
{
    if (self.person_view.frame.origin.x == 0) {
        //滚动条的动画显示
        [UIView animateWithDuration:0.6 animations:^{
            [self.grayBackgroundView1 setFrame:CGRectMake(-MAINSCREEN.width-50, 0, MAINSCREEN.width-50, MAINSCREEN.height)];
            [self.person_view setFrame:CGRectMake(-MAINSCREEN.width-50, 0, MAINSCREEN.width-50, MAINSCREEN.height)];
        }];
    }else
    {
        //滚动条的动画显示
        [UIView animateWithDuration:0.6 animations:^{
            [self.childChooseView setFrame:CGRectMake(MAINSCREEN.width/3,CGRectGetMaxY(self.navigationController.navigationBar.frame)-150,MAINSCREEN.width-MAINSCREEN.width/1.5, 150)];
            self.grayBackgroundView.hidden = YES;
        }];
    }
}
//
//-(void)didselectGrayBackGroundView
//{
//    //滚动条的动画显示
//    [UIView animateWithDuration:0.6 animations:^{
//        [self.grayBackgroundView setFrame:CGRectMake(-MAINSCREEN.width-50, 0, MAINSCREEN.width-50, MAINSCREEN.height)];
//        [self.person_view setFrame:CGRectMake(-MAINSCREEN.width-50, 0, MAINSCREEN.width-50, MAINSCREEN.height)];
//    }];
//}

-(void)selectPhoto
{
    [self choosePhotos];
}
/**
 * 点击每个扇形进入单科成绩页面
 * indexPath 扇形区域
 * subject科目
 * grade成绩
 * status进步退步标记
 * advance进步退步分数
 */
-(void)didselectWYChart:(NSInteger)indexPath subject:(NSString *)subject grade:(NSString *)grade advanceStatus:(NSString *)status advance:(NSString *)advance
{
    SingleGradeViewController * singleGradeViewController = [[SingleGradeViewController alloc]init];
    singleGradeViewController.grade_array = [[NSMutableArray alloc]init];
    [singleGradeViewController.grade_array addObject:subject];
    [singleGradeViewController.grade_array addObject:grade];
    [singleGradeViewController.grade_array addObject:status];
    [singleGradeViewController.grade_array addObject:advance];
    [self.navigationController pushViewController:singleGradeViewController animated:YES];
    
}
//进入成绩报告页面
-(void)gradeBaoGao
{
    NSLog(@"成绩报告跳转");
    GradeBaoGaoViewController * gradeBaoGaoViewController = [[GradeBaoGaoViewController alloc]init];
    gradeBaoGaoViewController.title = @"考试日期：2017年3月20日";
    [self.navigationController pushViewController:gradeBaoGaoViewController animated:YES];
}
//进入历史成绩controller
-(void)historyGrade{
    NSLog(@"历史成绩跳转");
    HistoryGradeViewController * historyGradeViewController = [[HistoryGradeViewController alloc]init];
    [self.navigationController pushViewController:historyGradeViewController animated:YES];
}
//点击了个人中心上面的cell
-(void)didselectCell:(NSInteger)row
{
    BasicsMessageViewController * basicsMessageViewController;
    LeavingViewController * leaving ;
    MyOrderViewController * myOrder;
    if (row == 0) {
        basicsMessageViewController = [[BasicsMessageViewController alloc]init];
        basicsMessageViewController.deleget = self;
        [self didselectGrayBackGroundView];
        [self.navigationController pushViewController:basicsMessageViewController animated:YES];
    }else if (row == 1){
        leaving = [[LeavingViewController alloc]init];
        [self didselectGrayBackGroundView];
        [self.navigationController pushViewController:leaving animated:YES];
    }
    else if (row == 2){
        myOrder = [[MyOrderViewController alloc]init];
        [self didselectGrayBackGroundView];
        [self.navigationController pushViewController:myOrder animated:YES];
    }
    else if (row == 3){
        StudentBingdingViewController * studentBingdingViewController = [[StudentBingdingViewController alloc]init];
        [self didselectGrayBackGroundView];
        studentBingdingViewController.delegat = self;
        [self.navigationController pushViewController:studentBingdingViewController animated:YES];
    }
    
}
/**
 *实例方法
 */
//个人中心页面返回到这个view的时候重新弹出个人中心的滑框
-(void)showPersonCenter
{
    [self personClick];
}
-(void)studentbingdingShowPersonCenter
{
    [self personClick];
}
-(void)personClick{
    NSLog(@"点击了首页的个人中心按钮");
    //滚动条的动画显示
    [UIView animateWithDuration:0.6 animations:^{
        [self.grayBackgroundView1 setFrame:CGRectMake(0,0,MAINSCREEN.width,MAINSCREEN.height)];
        [self.person_view setFrame:CGRectMake(0,0,MAINSCREEN.width-100,MAINSCREEN.height)];
    }];
    
}

//调用相机
//选择头像
- (void) choosePhotos
{
    
    // 判断是否支持相机
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        
    {
        //        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
        sheet = [[UIActionSheet alloc]
                 initWithTitle:nil
                 delegate:self
                 cancelButtonTitle:@"取消"
                 destructiveButtonTitle:nil
                 otherButtonTitles:@"打开照相机",@"从手机相册获取", nil];
    }
    
    else {
        
                sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册选择", nil];
//        sheet = [[UIActionSheet alloc]
//                 initWithTitle:nil
//                 delegate:self
//                 cancelButtonTitle:@"取消"
//                 destructiveButtonTitle:nil
//                 otherButtonTitles:@"打开照相机",@"从手机相册获取", nil];
    }
    
    sheet.tag = 555;
    [sheet showInView:self.view];
    
    UITapGestureRecognizer * tap3 = [UITapGestureRecognizer new];
    UIView * tap3_view = [tap3 view];
    if ((tap3_view.tag == 1)) {
        
    }else
    {
        
    }
    
}
//actionSheet回调
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 555) {
        NSUInteger sourceType = 0;
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    // 相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
//                case 1:
//                    // 相机
//                    sourceType = UIImagePickerControllerSourceTypeCamera;
//                    break;
                case 1:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
                case 2:
                    // 取消
                    return;
            }
        }
        else {
            if (buttonIndex == 0) {
                // 相册
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self didselectGrayBackGroundView];
            } else {
                return;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
        //[imagePickerController release];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //获取当前照相机工作状态
    NSString * mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    //判断，当前工作状态
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        //当前工作状态为照相
        //获取照相机拍摄的图片
        UIImage * image = [info valueForKey:UIImagePickerControllerOriginalImage];
        self.person_view.person_img.image = image;
        //修改个人头像
        [_person_btn setImage:image forState:UIControlStateNormal];
        //        [_headImageView setImage:image];
        [self personClick];
        //将图片保存到相册
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        }
        
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
//教师推荐按钮高亮
- (void)highlightButton:(UIButton *)b {
    [b setHighlighted:YES];
}
-(void) onButtonClick:(id)sender{
    NSLog(@"点击了 教师推荐");
    TeacherSuggestViewController * teacherSuggestViewController = [[TeacherSuggestViewController alloc]init];
    [self.navigationController pushViewController:teacherSuggestViewController animated:YES];
//    [self performSelector:@selector(highlightButton:) withObject:sender afterDelay:0.0];
}


/**
 *懒加载
 */
-(UIButton *)title_Button{
    if (!_title_Button) {
        _title_Button = [UIButton buttonWithType:UIButtonTypeCustom];
        // 添加 按钮名字
        [_title_Button setTitle:@"程远 ▼" forState:(UIControlStateNormal)];
        // 添加点击方法
        [_title_Button addTarget:self action:@selector(titleClick) forControlEvents:(UIControlEventTouchUpInside)];
        // 自适应大小
        [_title_Button setFrame:CGRectMake(0, 0, 100, 30)];
    }
    return _title_Button;
}
-(UIButton *)teacherSuggest_button{
    if (!_teacherSuggest_button) {
        _teacherSuggest_button = [UIButton buttonWithType:UIButtonTypeCustom];
        // 添加 按钮名字
        _teacherSuggest_button.frame = CGRectMake(MAINSCREEN.width-MAINSCREEN.width/5, MAINSCREEN.height-MAINSCREEN.height/5, MAINSCREEN.width/7, MAINSCREEN.width/7);
        _teacherSuggest_button.layer.cornerRadius = MAINSCREEN.width/14;
        UIImage * buttonImg = [UIImage imageNamed:@"chat_more_icons_file"];
        buttonImg = [buttonImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [_teacherSuggest_button setImage:buttonImg forState:UIControlStateNormal];
        // 添加点击方法
        [_teacherSuggest_button addTarget:self action:@selector(onButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        _teacherSuggest_button.clipsToBounds = YES;
//        // 自适应大小
//        [_teacherSuggest_button sizeToFit];
    }
    return _teacherSuggest_button;
}

-(ChildChooseView *)childChooseView
{
    if (!_childChooseView) {
        _childChooseView = [[ChildChooseView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/3,CGRectGetMaxY(self.navigationController.navigationBar.frame)-150,MAINSCREEN.width-MAINSCREEN.width/1.5, 150)];
        _childChooseView.childName_array = [[NSMutableArray alloc]initWithArray:childName_array];
        _childChooseView.deleget = self;
    }
    return _childChooseView;
}
-(GrayBackgroundView *)grayBackgroundView
{
    if (!_grayBackgroundView) {
        _grayBackgroundView = [[GrayBackgroundView alloc]initWithFrame:self.view.bounds];
        _grayBackgroundView.hidden = YES;
        _grayBackgroundView.deleget = self;
    }
    return _grayBackgroundView;
}
//个人中心
-(UIButton *)person_btn
{
    if (!_person_btn) {
        _person_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_person_btn setImage:[UIImage imageNamed:@"haizeiwang2"] forState:UIControlStateNormal];
        _person_btn.frame = CGRectMake(0, 0, 35, 35);
        _person_btn.layer.cornerRadius = 17.5;
        [_person_btn addTarget:self action:@selector(personClick) forControlEvents:UIControlEventTouchUpInside];
        //填充方式
        [_person_btn setContentMode:UIViewContentModeScaleAspectFill];
        _person_btn.clipsToBounds = YES;
        //点击时发光
        [_person_btn setShowsTouchWhenHighlighted:YES];
    }
    return _person_btn;
}
//个人中心页面
-(PersonView *)person_view{
    if (!_person_view) {
        _person_view = [[PersonView alloc]init];
        _person_view.delegat = self;
    }
    return _person_view;
}
//个人中心页面背景
-(GrayBackgroundView *)grayBackgroundView1{
    if (!_grayBackgroundView1) {
        
        _grayBackgroundView1 = [[GrayBackgroundView alloc]initWithFrame:self.view.bounds];
        _grayBackgroundView1.deleget = self;
    }
    return _grayBackgroundView1;
}
-(GradeView *)gradeView
{
    if (!_gradeView) {
        _gradeView = [[GradeView alloc]initWithFrame:CGRectMake(0, -10, MAINSCREEN.width, MAINSCREEN.height)];
        [_gradeView setContentSize:CGSizeMake(MAINSCREEN.width, MAINSCREEN.height*1.6)];
        _gradeView.selectWYCdelegate = self;
//        _gradeView.scrollEnabled = NO;
    }
    return _gradeView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"11");
}
-(void)viewDidDisappear:(BOOL)animated
{
NSLog(@"12");
}
-(void)viewWillDisappear:(BOOL)animated
{
NSLog(@"13");
//    [self.gradeView end];
}
//退出登录
-(void)loginOut
{
    [self didselectGrayBackGroundView];
    LoginViewController * loginViewController = [[LoginViewController alloc]init];
    [self presentViewController:loginViewController animated:YES completion:nil];
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
