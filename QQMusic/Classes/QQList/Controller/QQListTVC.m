//
//  QQListTVC.m
//  QQMusic
//
//  Created by Apple on 16/5/17.
//  Copyright © 2016年 KeenLeung. All rights reserved.
//

#import "QQListTVC.h"
#import "QQMusicDataTool.h"
#import "QQMusicListCell.h"
#import "QQMusicOperationTool.h"

@interface QQListTVC ()

/** 数据*/
@property (nonatomic, strong) NSArray *musicMs;

@end

@implementation QQListTVC

/** 重写 set 方法*/
- (void)setMusicMs:(NSArray *)musicMs {
    _musicMs = musicMs;
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始界面
    [self setUpInit];
    
    // 获取数据
    [QQMusicDataTool getMusicList:^(NSArray<QQMusicModel *> *musics) {
        
        self.musicMs = musics;
        
        // 设置播放列表
        [QQMusicOperationTool shareInstance].musicMList = self.musicMs;
    }];
}

#pragma mark --------------------------
#pragma mark 初始

- (void)setUpInit {
    
    [self setUpNavigationBar];
    
    [self setUpTableView];
}

- (void)setUpNavigationBar {
    
    self.navigationController.navigationBar.hidden = YES;

    // 修改状态栏字体颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)setUpTableView {
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQListBack"]];
    [self.tableView setBackgroundView:backgroundView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark --------------------------
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.musicMs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 取出模型
    QQMusicModel *music = self.musicMs[indexPath.row];
    
    QQMusicListCell *cell = [QQMusicListCell cellWithTableView:tableView];
    cell.music = music;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QQMusicListCell *musicCell = (QQMusicListCell *)cell;
    
    // 判断 tableView 的滑动方向
    CGPoint translation = [tableView.panGestureRecognizer translationInView:tableView.superview];
    if (translation.y>0) { // 接近第一行
        
        [musicCell beginAnimation:RE_Rotation];
        
    }else if(translation.y<0){ // 远离第一行
        
        [musicCell beginAnimation:Rotation];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 取出模型
    QQMusicModel *music = self.musicMs[indexPath.row];
    
    // 播放音乐
    [[QQMusicOperationTool shareInstance] playMusic:music];
    
    // 跳转到详情页
    [self performSegueWithIdentifier:@"toDetailVC" sender:nil];
}

/** 行高*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


@end
