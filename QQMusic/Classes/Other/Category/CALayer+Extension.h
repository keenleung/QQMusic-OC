//
//  CALayer+Extension.h
//  QQMusic
//
//  Created by Apple on 16/5/18.
//  Copyright © 2016年 KeenLeung. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (Extension)

/**
 *  暂停动画
 */
- (void)pauseAnimate;

/**
 *  恢复动画
 */
- (void)resumeAnimate;

@end
