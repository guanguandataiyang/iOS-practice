//
//  NoteDAO.h
//  PersistenceLayer
//
//  Created by 关沛东 on 15/11/8.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NoteDAODelegate.h"
#import "Note.h"

#define HOST_PATH @"/service/mynotes/WebService.php"
#define HOST_NAME @"51work6.com"
#define USER_ID  @"<你的51work6.com用户邮箱>"

@interface NoteDAO : NSObject

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;

@property (weak, nonatomic) id <NoteDAODelegate> delegate;

//插入Note方法
-(void) create:(Note*)model;

//删除Note方法
-(void) remove:(Note*)model;

//修改Note方法
-(void) modify:(Note*)model;

//查询所有数据方法
-(void) findAll;

+ (NoteDAO*)sharedManager;

@end

