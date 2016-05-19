//
//  QQMusicDataTool.h
//  QQMusic
//
//  Created by Apple on 16/5/17.
//  Copyright © 2016年 KeenLeung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QQMusicModel.h"

typedef void (^ReturnBlock)(NSArray<QQMusicModel *> *musics);

@interface QQMusicDataTool : NSObject

+ (void)getMusicList: (ReturnBlock) result;

@end
