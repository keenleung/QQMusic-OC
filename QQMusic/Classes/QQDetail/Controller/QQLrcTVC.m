//
//  QQLrcTVC.m
//  QQMusic
//
//  Created by Apple on 16/5/18.
//  Copyright © 2016年 KeenLeung. All rights reserved.
//

#import "QQLrcTVC.h"
#import "QQLrcCell.h"
#import "UIView+Extension.h"

@interface QQLrcTVC()

/** 记录历史歌词所在的行*/
@property (nonatomic, assign) NSInteger oldScrollRow;

@end

@implementation QQLrcTVC

#pragma mark --------------------------
#pragma mark 初始

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // 去掉线条
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 不给选中
    self.tableView.allowsSelection = NO;
    
    self.oldScrollRow = -1;
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    // 增加内边距
    CGFloat insetH = self.tableView.height * 0.5;
    self.tableView.contentInset = UIEdgeInsetsMake(insetH, 0, insetH, 0);
}

#pragma mark --------------------------
#pragma mark 重写 set 方法
- (void)setDatasource:(NSArray<QQLrcModel *> *)datasource{
    
    _datasource = datasource;
    
    [self.tableView reloadData];
}

/** 实时滚动到指定的行*/
- (void)setScrollRow:(NSInteger)scrollRow{
    
    _scrollRow = scrollRow;
    
    if (scrollRow != self.oldScrollRow) {
        
        //NSLog(@"当前歌词所在的行: ===== %zd", scrollRow);
        
        // tableView 滚动到指定的行
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:scrollRow inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        
        self.oldScrollRow = scrollRow;
    }
}

/** 设置歌词的播放进度*/
- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    // 1.获取当前正在播放的 cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.scrollRow inSection:0];
    QQLrcCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];

    // 2.设置播放进度
    cell.progress = progress;
}


#pragma mark --------------------------
#pragma mark UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 创建 cell
    QQLrcCell *cell = [QQLrcCell cellWithTable:tableView];
    
    // 取出模型
    QQLrcModel *lrcModel = self.datasource[indexPath.row];
    cell.lrcModel = lrcModel;
    
    return cell;
}


@end
