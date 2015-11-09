//
//  NoteBL.h
//  BusinessLogicLayer
//
//  Created by 关沛东 on 15/11/8.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <PersistenceLayer/Note.h>
#import <PersistenceLayer/NoteDAO.h>
#import <PersistenceLayer/NoteDAODelegate.h>
#import "NoteBLDelegate.h"

@interface NoteBL : NSObject <NoteDAODelegate>

@property (weak, nonatomic) id <NoteBLDelegate> delegate;

//插入Note方法
-(void) createNote:(Note*)model;

//删除Note方法
-(void) removeNote:(Note*)model;

//查询所有数据方法
-(void) findAllNotes;

//修改数据方法
-(void) modifyNote:(Note*)model;

@end
