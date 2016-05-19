//
//  QQLrcTVC.h
//  QQMusic
//
//  Created by Apple on 16/5/18.
//  Copyright © 2016年 KeenLeung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQLrcModel.h"

@interface QQLrcTVC : UITableViewController

/** 数据源*/
@property (nonatomic, strong) NSArray<QQLrcModel *> *datasource;

/** 指定歌词滚动到某一行*/
@property (nonatomic, assign) NSInteger scrollRow;

/** 当前歌词的播放进度*/
@property (nonatomic, assign) CGFloat progress;

@end
