//
//  NoteDAO.m
//  PersistenceLayer
//
//  Created by 关沛东 on 15/11/8.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import "NoteDAO.h"




#import "NoteDAO.h"

#import "NSNumber+Message.h"
#import "MKNetworkKit.h"

@implementation NoteDAO

static NoteDAO *sharedManager = nil;

+ (NoteDAO*)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}


//插入Note方法
-(void) create:(Note*)model
{
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    [param setValue:USER_ID forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"add" forKey:@"action"];
    [param setValue:model.date forKey:@"date"];
    [param setValue:model.content forKey:@"content"];
    
    MKNetworkOperation *op = [engine operationWithPath:HOST_PATH params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        NSInteger resultCode = [resultCodeNumber integerValue];
        
        if (resultCode >=0) {
            [self.delegate createFinished];
        } else {
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            
            [self.delegate createFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *operation, NSError* err) {
        NSLog(@"MKNetwork请求错误 : %@", err.localizedDescription);
        [self.delegate createFailed:err];
    }];
    [engine enqueueOperation:op];
}

//删除Note方法
-(void) remove:(Note*)model
{
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    [param setValue:USER_ID forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"remove" forKey:@"action"];
    [param setValue:model.ID forKey:@"id"];
    
    MKNetworkOperation *op = [engine operationWithPath:HOST_PATH params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        NSInteger resultCode = [resultCodeNumber integerValue];
        
        if (resultCode >=0) {
            [self.delegate removeFinished];
        } else {
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            
            [self.delegate removeFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSLog(@"MKNetwork请求错误 : %@", err.localizedDescription);
        [self.delegate removeFailed:err];
    }];
    
    [engine enqueueOperation:op];
}

//修改Note方法
-(void) modify:(Note*)model
{
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:USER_ID forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"modify" forKey:@"action"];
    [param setValue:model.ID forKey:@"id"];
    [param setValue:model.date forKey:@"date"];
    [param setValue:model.content forKey:@"content"];
    
    MKNetworkOperation *op = [engine operationWithPath:HOST_PATH params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        NSInteger resultCode = [resultCodeNumber integerValue];
        
        
        if (resultCode >=0) {
            [self.delegate modifyFinished];
        } else {
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            
            [self.delegate modifyFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSLog(@"MKNetwork请求错误 : %@", err.localizedDescription);
        [self.delegate modifyFailed:err];
        
    }];
    
    [engine enqueueOperation:op];
    
}

//查询所有数据方法
-(void) findAll
{
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:USER_ID forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"query" forKey:@"action"];
    
    MKNetworkOperation *op = [engine operationWithPath:HOST_PATH params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        NSInteger resultCode = [resultCodeNumber integerValue];
        
        if (resultCode >=0) {
            NSMutableArray* listDict = [resDict objectForKey:@"Record"];
            
            NSMutableArray *listData = [NSMutableArray new];
            
            for (NSDictionary* dic in listDict) {
                Note *note = [Note new];
                note.ID = [dic objectForKey:@"ID"];
                note.date = [dic objectForKey:@"CDate"];
                note.content = [dic objectForKey:@"Content"];
                [listData addObject:note];
            }
            [self.delegate findAllFinished:listData];
        } else {
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate findAllFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSLog(@"MKNetwork请求错误 : %@", err.localizedDescription);
        [self.delegate findAllFailed:err];
    }];
    
    [engine enqueueOperation:op];
    
}


@end
