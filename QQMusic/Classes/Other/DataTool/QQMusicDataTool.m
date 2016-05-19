//
//  QQMusicDataTool.m
//  QQMusic
//
//  Created by Apple on 16/5/17.
//  Copyright © 2016年 KeenLeung. All rights reserved.
//

#import "QQMusicDataTool.h"

@implementation QQMusicDataTool

+ (void)getMusicList: (ReturnBlock)result {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Musics.plist" ofType:nil];
    
    if (path == nil) {
        
        result([[NSArray alloc] init]);
    }
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    
    if (arr == nil) {
        
        result([[NSArray alloc] init]);
    }
    
    // 字典转模型
    NSMutableArray<QQMusicModel *> *arrM = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger index, BOOL * _Nonnull stop) {
        
        QQMusicModel *music = [QQMusicModel modelWithDict:dict];
        [arrM addObject:music];
    }];

    [arrM addObjectsFromArray:arrM];
    
    // 返回结果
    result(arrM);
}

@end
