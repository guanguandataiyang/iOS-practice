//
//  Note.h
//  PersistenceLayer
//
//  Created by 关沛东 on 15/11/8.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property(nonatomic, strong) NSString* ID;
@property(nonatomic, strong) NSString* date;
@property(nonatomic, strong) NSString* content;

@end
