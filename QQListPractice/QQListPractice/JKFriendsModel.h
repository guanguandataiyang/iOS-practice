//
//  JKFriendsModel.h
//  QQList
//
//  Created by 关沛东 on 15/11/9.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKFriendsModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, assign) BOOL isVip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendWithDict:(NSDictionary *)dict;
@end
