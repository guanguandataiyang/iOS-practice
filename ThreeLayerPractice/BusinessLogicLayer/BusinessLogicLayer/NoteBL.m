//
//  NoteBL.m
//  BusinessLogicLayer
//
//  Created by 关沛东 on 15/11/8.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import "NoteBL.h"

@implementation NoteBL

//插入Note方法
-(void) createNote:(Note*)model
{
    NoteDAO* dao = [NoteDAO sharedManager];
    dao.delegate = self;
    [dao create:model];
}

//删除Note方法
-(void) removeNote:(Note*)model
{
    NoteDAO* dao = [NoteDAO sharedManager];
    dao.delegate = self;
    [dao remove:model];
}

//查询所有数方法
-(void) findAllNotes
{
    NoteDAO* dao = [NoteDAO sharedManager];
    dao.delegate = self;
    [dao findAll];
}


//修改数据方法
-(void) modifyNote:(Note*)model
{
    NoteDAO* dao = [NoteDAO sharedManager];
    dao.delegate = self;
    [dao modify:model];
}

#pragma --mark NoteDAODelegate 委托方法
//查询所有数据方法 成功
- (void)findAllFinished:(NSMutableArray *)list
{
    [self.delegate findAllNotesFinished:list];
}

//查询所有数据方法 失败
- (void)findAllFailed:(NSError *)error
{
    [self.delegate findAllNotesFailed:error];
}

//插入Note方法 成功
- (void)createFinished
{
    [self.delegate createNoteFinished];
}

//插入Note方法 失败
- (void)createFailed:(NSError *)error
{
    [self.delegate createNoteFailed:error];
}

//删除Note方法 成功
- (void)removeFinished
{
    [self.delegate removeNoteFinished];
}
//删除Note方法 失败
- (void)removeFailed:(NSError *)error
{
    [self.delegate removeNoteFailed:error];
}
//修改Note方法 成功
- (void)modifyFinished
{
    [self.delegate modifyNoteFinished];
}

//修改Note方法 失败
- (void)modifyFailed:(NSError *)error
{
    [self.delegate modifyNoteFailed:error];
}

@end
