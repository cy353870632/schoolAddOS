//
//  HomeWorkMessageViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/3/3.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "HomeWorkMessageViewController.h"

@interface HomeWorkMessageViewController ()<UITableViewDelegate,UITableViewDataSource,IFlySpeechSynthesizerDelegate>
@property (nonatomic, strong) IFlySpeechSynthesizer * iFlySpeechSynthesizer;//讯飞语音实例
@end

@implementation HomeWorkMessageViewController
-(void)viewWillDisappear:(BOOL)animated
{
    [_iFlySpeechSynthesizer stopSpeaking];//结束说话
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeWorkMessage_array = [[NSMutableArray alloc]init];
    [self.homeWorkMessage_array addObject:@"1，把课本49页的写了"];
    [self.homeWorkMessage_array addObject:@"2，上次考试的卷子错题写一遍上次考试的卷子错题写一遍上次考试的卷子错题写一遍上次考试的卷子错题写一遍上次考试的卷子错题写一遍上次考试的卷子错题写一遍上次考试的卷子错题写一遍"];
    [self.homeWorkMessage_array addObject:@"3，做一个手工"];
    [self.homeWorkMessage_array addObject:@"4，听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词听写单词"];
    [self.view addSubview:self.homeWork_tableView];
    
    UIButton * sound_button = [UIButton buttonWithType:UIButtonTypeSystem];
    sound_button.frame = CGRectMake(MAINSCREEN.width-100, MAINSCREEN.height-150, 80, 45);
    sound_button.backgroundColor = [UIColor whiteColor];
    [sound_button setTitle:@"语音播报" forState:UIControlStateNormal];
    [sound_button addTarget:self action:@selector(soundClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sound_button];
    
    [self initXunFeiYuYin];
    
}
-(void)soundClick{
    NSString * str = @"";
    for (int i = 0; i < self.homeWorkMessage_array.count; i++) {
        str =[NSString stringWithFormat:@"%@%@",str,self.homeWorkMessage_array[i]];

    }
    [_iFlySpeechSynthesizer startSpeaking:str];//开始说话
    
    [_iFlySpeechSynthesizer startSpeaking:@"播报结束"];//开始说话
    [_iFlySpeechSynthesizer stopSpeaking];//结束说话
}
-(void)initXunFeiYuYin{
    //实例化语音
    _iFlySpeechSynthesizer = [[IFlySpeechSynthesizer alloc]init];
    
    _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    _iFlySpeechSynthesizer.delegate = self;
    //设置语音合成的参数
    //语速,取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"25" forKey:[IFlySpeechConstant SPEED]];
    //音量;取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey: [IFlySpeechConstant VOLUME]];
    //发音人,默认为”xiaoyan”;可以设置的参数列表可参考个 性化发音人列表
    [_iFlySpeechSynthesizer setParameter:@" xiaoyan " forKey: [IFlySpeechConstant VOICE_NAME]];
    //音频采样率,目前支持的采样率有 16000 和 8000
    [_iFlySpeechSynthesizer setParameter:@"16000" forKey: [IFlySpeechConstant SAMPLE_RATE]];
    //asr_audio_path保存录音文件路径，如不再需要，设置value为nil表示取消，默认目录是documents
    [_iFlySpeechSynthesizer setParameter:@" tts.pcm" forKey: [IFlySpeechConstant TTS_AUDIO_PATH]];
}
-(UITableView *)homeWork_tableView
{
    if (!_homeWork_tableView) {
        _homeWork_tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _homeWork_tableView.delegate = self;
        _homeWork_tableView.dataSource = self;
        _homeWork_tableView.backgroundColor = Q_gray_color;
        [_homeWork_tableView setSectionFooterHeight:3];
        _homeWork_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _homeWork_tableView.showsVerticalScrollIndicator = NO;
    }
    return _homeWork_tableView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.homeWorkMessage_array.count;
}
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 30;
    }
    return 3;
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
    _cell = [[HomeWorkMessageCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    [_cell.layer setCornerRadius:10];
    [_cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSString * str = self.homeWorkMessage_array[indexPath.section];
    if (str.length/20 < 3) {
        _cell.homewrokmessage_label.frame = CGRectMake(20, 10, MAINSCREEN.width-40,30 * str.length/21);
    }else
    {
        _cell.homewrokmessage_label.frame = CGRectMake(20, 5, MAINSCREEN.width-40,20 * str.length/21);
    }
    
    _cell.homewrokmessage_label.text = str;

    return _cell;
    
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = self.homeWorkMessage_array[indexPath.section];
    if (str.length/20 < 3) {
        return 30;
    }
    return 20 * str.length/20+5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
