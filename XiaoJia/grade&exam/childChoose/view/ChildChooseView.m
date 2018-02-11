//
//  ChildChooseView.m
//  XiaoJia
//
//  Created by 程远 on 17/2/23.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ChildChooseView.h"
#define selfScreen self.bounds.size
@interface ChildChooseView()<UITableViewDelegate,UITableViewDataSource>
{
    ChildChooseTableViewCell * childChooseTableViewCell;
    
}
@property(strong,nonatomic)UITableView * chlidChoos_table;
@end

@implementation ChildChooseView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.chlidChoos_table];
    }
    return self;
}


-(UITableView *)chlidChoos_table
{
    if (!_chlidChoos_table) {
        _chlidChoos_table = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _chlidChoos_table.delegate = self;
        _chlidChoos_table.dataSource = self;
        _chlidChoos_table.sectionFooterHeight = 0;
    }
    return _chlidChoos_table;
}
//没个分组里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.childName_array.count+1;
}
//有多少个分组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    childChooseTableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    childChooseTableViewCell = [[ChildChooseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier viewSize:self.bounds.size];
    if (indexPath.row == 3) {
        childChooseTableViewCell.addChild_imageView.hidden = NO;
    }else
    {
        childChooseTableViewCell.childName_label.hidden = NO;
        childChooseTableViewCell.childName_label.text = self.childName_array[indexPath.row];

    }
    
    return childChooseTableViewCell;
    

}
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 3) {
        [self.deleget addChild];
    }else
    {
        [self.deleget chooseChild:indexPath.row];
    }
}
@end
