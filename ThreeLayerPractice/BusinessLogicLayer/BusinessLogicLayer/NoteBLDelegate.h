//
//  NoteBLDelegate.h
//  BusinessLogicLayer
//
//  Created by 关沛东 on 15/11/8.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NoteBLDelegate <NSObject>

@optional
//查询所有数据方法 成功
- (void)findAllNotesFinished:(NSMutableArray *)list;
//查询所有数据方法 失败
- (void)findAllNotesFailed:(NSError *)error;

//插入Note方法 成功
- (void)createNoteFinished;
//插入Note方法 失败
- (void)createNoteFailed:(NSError *)error;

//删除Note方法 成功
- (void)removeNoteFinished;
//删除Note方法 失败
- (void)removeNoteFailed:(NSError *)error;

//修改Note方法 成功
- (void)modifyNoteFinished;
//修改Note方法 失败
- (void)modifyNoteFailed:(NSError *)error;
@end
