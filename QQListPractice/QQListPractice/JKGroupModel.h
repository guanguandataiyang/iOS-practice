//
//  JKGroupModel.h
//  QQList
//
//  Created by 关沛东 on 15/11/9.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JKFriendsModel;
@interface JKGroupModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) JKFriendsModel *friendModel;
@property (nonatomic, assign) BOOL isOpen;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)GroupWithDict:(NSDictionary *)dict;

@end
