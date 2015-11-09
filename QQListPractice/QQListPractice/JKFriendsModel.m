//
//  JKFriendsModel.m
//  QQList
//
//  Created by 关沛东 on 15/11/9.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import "JKFriendsModel.h"

@implementation JKFriendsModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
