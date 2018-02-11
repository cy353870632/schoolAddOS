//
//  PublishCrcleViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/3/6.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "PublishCrcleViewController.h"
#import "ZLPhotoActionSheet.h"
#import "ZLShowBigImage.h"
#import "ZLDefine.h"
#import "ZLCollectionCell.h"
@interface PublishCrcleViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITextViewDelegate>
{
    UITapGestureRecognizer * tap;
    UIImageView * fenge_img;
}
@property(strong,nonatomic)UITextView * content_textview;
@property (nonatomic, strong) NSArray<ZLSelectPhotoModel *> *lastSelectMoldels;
@property (nonatomic, strong) NSMutableArray *arrDataSources;
@end

@implementation PublishCrcleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布圈子";
    _arrDataSources = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
    
    self.content_textview = [[UITextView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/20,10,MAINSCREEN.width-MAINSCREEN.width/10, MAINSCREEN.height/2-10)];
    [self.content_textview setBackgroundColor:[UIColor whiteColor]];
    [self.content_textview setFont:[UIFont systemFontOfSize:16]];
    self.content_textview.text = @"我想说。。。";
    //    _beizhu_textview.layer.borderWidth = 0.8;
    self.content_textview.textColor = [UIColor grayColor];
    //    _beizhu_textview.layer.borderColor = Q_gray_color.CGColor;
    self.content_textview.delegate = self;
    [self.view addSubview:self.content_textview];
    
    fenge_img = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.content_textview.frame), MAINSCREEN.width, 0.5)];
    fenge_img.backgroundColor = Q_gray_color;
    [self.view addSubview:fenge_img];
    
    [self initCollectionView];
    //选择图片的手势按钮
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(choosePhoto)];
    
    //作业按钮
    UIBarButtonItem * homeWork_rightButton = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(fabu_Cliek)];
    [homeWork_rightButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = homeWork_rightButton;

    
}
-(void)fabu_Cliek{
    NSLog(@"点击了 发布圈子 发布按钮");
}
- (void)initCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((MAINSCREEN.width-9)/3.5, (MAINSCREEN.width-9)/3.5);
    layout.minimumInteritemSpacing = 1.5;
    layout.minimumLineSpacing = 1.5;
    layout.sectionInset = UIEdgeInsetsMake(3, 0, 3, 0);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(13, CGRectGetMaxY(fenge_img.frame)+3, MAINSCREEN.width-30, MAINSCREEN.height) collectionViewLayout:layout];

    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZLCollectionCell" bundle:kZLPhotoBrowserBundle] forCellWithReuseIdentifier:@"ZLCollectionCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
}
-(void)choosePhoto
{
    ZLPhotoActionSheet *actionSheet = [[ZLPhotoActionSheet alloc] init];
    //设置照片最大选择数
    actionSheet.maxSelectCount = 9;
    //设置照片最大预览数
    actionSheet.maxPreviewCount = 20;
    actionSheet.arratYijingChoosePhoto = [NSMutableArray array];
    actionSheet.arratYijingChoosePhoto = _arrDataSources;
    NSLog(@"%@",actionSheet.arratYijingChoosePhoto);
    weakify(self);
    [actionSheet showPreviewPhotoWithSender:self animate:YES lastSelectPhotoModels:self.lastSelectMoldels completion:^(NSArray<UIImage *> * _Nonnull selectPhotos, NSArray<ZLSelectPhotoModel *> * _Nonnull selectPhotoModels) {
        strongify(weakSelf);
//        [_arrDataSources removeAllObjects];
        for (int i = 0; i < selectPhotos.count; i++) {
            [_arrDataSources addObject:selectPhotos[i]];
        }
        strongSelf.lastSelectMoldels = selectPhotoModels;
        [strongSelf.collectionView reloadData];
        
        NSLog(@"%@", selectPhotos);
    }];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_arrDataSources.count <9) {
        return _arrDataSources.count+1;
    }
    return _arrDataSources.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZLCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZLCollectionCell" forIndexPath:indexPath];
//    //设置删除按钮
//    cell.btnSelect.tag = indexPath.row;
//    [cell.btnSelect setImage:[UIImage imageNamed:@"icon_cross"] forState:UIControlStateNormal];
//    [cell.btnSelect addTarget:self action:@selector(deletePhoto:) forControlEvents:UIControlEventTouchUpInside];
//    
//    cell.btnSelect.hidden = YES;//隐藏删除按钮
    
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.layer.cornerRadius = 7;
    if (indexPath.row == _arrDataSources.count || _arrDataSources.count==0) {
//        cell.layer.borderWidth = 0.5;
//        cell.layer.borderColor = Q_gray_color.CGColor;
        cell.imageView.image = [UIImage imageNamed:@"chat_toolbar_more_nor"];
        cell.btnSelect.hidden = YES;
    }else
    {
        cell.btnSelect.hidden = YES;
    cell.imageView.image = _arrDataSources[indexPath.row];
    }
    
    return cell;
}
-(void)deletePhoto:(id)sender
{
    UIButton * button = sender;
    NSLog(@"删除%ld",button.tag);
	[_arrDataSources removeObjectAtIndex:button.tag];
    [_collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _arrDataSources.count || _arrDataSources.count==0) {
        [self choosePhoto];
    }else
    {
//        ZLCollectionCell *cell = (ZLCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
//        [ZLShowBigImage showBigImage:cell.imageView];
    }
    
    
}


//textview的假提示
- (void)textViewDidBeginEditing:(UITextView *)textView {

    if ([textView.text isEqualToString:@"我想说。。。"]) {
        textView.text = @"";
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length<1) {
        textView.text = @"我想说。。。";
        textView.textColor = [UIColor grayColor];
    }else
    {
        textView.textColor = [UIColor blackColor];
    }

}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (textView.textColor == [UIColor grayColor]) {
        textView.textColor = [UIColor blackColor];
    }else
    {
        textView.textColor = [UIColor grayColor];
    }
    textView.textColor = [UIColor blackColor];
    if ([text isEqual:@"\n"]) {
        //编辑结束，键盘消失
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
    
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
