//
//  QQMusicListCell.h
//  QQMusic
//
//  Created by Apple on 16/5/17.
//  Copyright © 2016年 KeenLeung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQMusicModel.h"

/** 动画类型*/
typedef NS_OPTIONS(NSUInteger, AnimationType) {
    Rotation = 1 << 0,
    Translation = 1 << 1,
    RE_Rotation = 1 << 2,
};

@interface QQMusicListCell : UITableViewCell

@property (nonatomic, strong) QQMusicModel *music;

/** 创建 cell*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** 执行动画*/
- (void)beginAnimation:(AnimationType)type;

@end
