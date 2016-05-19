//
//  QQMusicListCell.m
//  QQMusic
//
//  Created by Apple on 16/5/17.
//  Copyright © 2016年 KeenLeung. All rights reserved.
//

#import "QQMusicListCell.h"
#import "UIView+Extension.h"

static NSString * const reuseId = @"cellId";


@interface QQMusicListCell()

/** 歌手头像*/
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

/** 歌曲名*/
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;

/** 歌手名称*/
@property (weak, nonatomic) IBOutlet UILabel *singerNameLabel;

@end

@implementation QQMusicListCell

- (void)awakeFromNib{
    
    // 头像设置圆角
    self.iconImageView.layer.cornerRadius = self.iconImageView.width * 0.5;
    self.iconImageView.layer.masksToBounds = YES;
}


/** 给子控件赋值*/
- (void)setMusic:(QQMusicModel *)music{
    
    _music = music;
    
    if (music.icon) {
        
        self.iconImageView.image = [UIImage imageNamed: music.icon];
    }
    
    self.songNameLabel.text = music.name;
    self.singerNameLabel.text = music.singer;
}

/** 创建 cell*/
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    QQMusicListCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QQMusicListCell class]) owner:nil options:nil].firstObject;
    }
    
    return cell;
}

/** 执行动画*/
- (void)beginAnimation:(AnimationType)type{
    
    switch (type) {
        case Rotation:{
            
            NSString *key = @"rotation";
            // 移除之前的动画
            [self.layer removeAnimationForKey:key];
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
            animation.values = @[@(-M_PI * 0.15), @0];
            animation.duration = 0.2;
            [self.layer addAnimation:animation forKey:key];
            
            break;
        }
            
        case Translation:{

            NSString *key = @"translation";
            [self.layer removeAnimationForKey:key];
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
            animation.values = @[@50, @0];
            [self.layer addAnimation:animation forKey:key];
        }

        case RE_Rotation:{

            NSString *key = @"rotation";
            // 移除之前的动画
            [self.layer removeAnimationForKey:key];
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
            animation.values = @[@(M_PI * 0.15), @0];
            animation.duration = 0.2;
            [self.layer addAnimation:animation forKey:key];

            break;
        }

        default:
            break;
    }
}


/** 防止高亮*/
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{

}

@end
