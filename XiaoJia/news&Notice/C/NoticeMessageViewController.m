//
//  NoticeMessageViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/24.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "NoticeMessageViewController.h"

@interface NoticeMessageViewController ()
{
    UILabel * title_label;
    UILabel * time_label;
    UILabel * creatBy_label;
    UIImageView * fenge_img;
    UILabel * content_label;
}
@end

@implementation NoticeMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通知详情";
    
    NSString * content = @"容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!\n容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!\n容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!";
    
    UIScrollView * scroller_view = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    NSInteger huanhang = [self contentNumber:content findStr:@"\n"];

    NSInteger i = content.length/24+huanhang-24;
    if (i > 0) {
        [scroller_view setContentSize:CGSizeMake(MAINSCREEN.width, MAINSCREEN.height+i*25)];
    }else
    {
    [scroller_view setContentSize:CGSizeMake(MAINSCREEN.width,MAINSCREEN.height)];
        scroller_view.scrollEnabled = NO;
    }
    
    [self.view addSubview:scroller_view];
    
    title_label = [[UILabel alloc]initWithFrame:CGRectMake(10,0,MAINSCREEN.width-20, MAINSCREEN.height/11)];
    title_label.textAlignment = NSTextAlignmentCenter;
    title_label.font = [UIFont fontWithName:@"Helvetica" size:19];
    title_label.text = @"这是一条通知的详情";
    [scroller_view addSubview:title_label];
    
    time_label = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(title_label.frame)+5,MAINSCREEN.width/2-20, 20)];
    time_label.textAlignment = NSTextAlignmentCenter;
    time_label.font = [UIFont fontWithName:@"Helvetica" size:13];
    time_label.text = @"时间：2017-05-24 08:00";
    [scroller_view addSubview:time_label];
    
    creatBy_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(time_label.frame)+10, CGRectGetMaxY(title_label.frame)+5,MAINSCREEN.width/2-20, 20)];
    creatBy_label.textAlignment = NSTextAlignmentCenter;
    creatBy_label.font = [UIFont fontWithName:@"Helvetica" size:13];
    creatBy_label.text = @"来源：学校教德处";
    [scroller_view addSubview:creatBy_label];
    
    
    fenge_img = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(time_label.frame)+5, MAINSCREEN.width, 1)];
    [fenge_img setBackgroundColor:[UIColor grayColor]];
    [scroller_view addSubview:fenge_img];
    
    
    
    
    content_label = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(fenge_img.frame)+5,MAINSCREEN.width-20, content.length/24*25)];
    content_label.textAlignment = NSTextAlignmentCenter;
    content_label.font = [UIFont fontWithName:@"Helvetica" size:15];
    content_label.numberOfLines = 0;
//    content_label.text = content;
    content_label.lineBreakMode = NSLineBreakByCharWrapping;
    [scroller_view addSubview:content_label];

    NSDictionary *attributesDic = [self settingAttributesWithLineSpacing:5 FirstLineHeadIndent:2 * 14 Font:[UIFont fontWithName:@"Helvetica" size:15] TextColor:[UIColor grayColor]];
    content_label.attributedText = [[NSAttributedString alloc] initWithString:content attributes:attributesDic];
    
    
}
-(NSDictionary *)settingAttributesWithLineSpacing:(CGFloat)lineSpacing FirstLineHeadIndent:(CGFloat)firstLineHeadIndent Font:(UIFont *)font TextColor:(UIColor *)textColor{
    //分段样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paragraphStyle.lineSpacing = lineSpacing;
    //首行缩进
    paragraphStyle.firstLineHeadIndent = firstLineHeadIndent;
    //富文本样式
    NSDictionary *attributeDic = @{
                                   NSFontAttributeName : font,
                                   NSParagraphStyleAttributeName : paragraphStyle,
                                   NSForegroundColorAttributeName : textColor
                                   };
    return attributeDic;
}

-(NSInteger)contentNumber:(NSString *)Text findStr:(NSString *)findStr{
    NSInteger content = 0;
    
    while ([Text containsString:findStr]) {
        NSRange range = [Text rangeOfString:findStr];
        Text = [Text substringFromIndex:range.location+findStr.length];
        content++;
    }
    
    
    return content;
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
