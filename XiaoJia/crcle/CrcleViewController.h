//
//  CrcleViewController.h
//  XiaoJia
//
//  Created by 程远 on 17/2/22.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomViewController.h"
#import "CellForWorkGroup.h"
#import "CellForWorkGroupRepost.h"
#import "YHRefreshTableView.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "YHWorkGroup.h"
#import "YHUserInfoManager.h"
#import "YHUtils.h"
#import "YHSharePresentView.h"
@interface CrcleViewController : CustomViewController

@property(strong,nonatomic)UIButton * addCrcle_btn;//新增朋友圈子
@property (nonatomic,assign) NSInteger curPageIndex;
@end
