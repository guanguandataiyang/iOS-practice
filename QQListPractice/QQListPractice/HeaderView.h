//
//  HeaderView.h
//  QQList
//
//  Created by 关沛东 on 15/11/9.
//  Copyright (c) 2015年 关沛东. All rights reserved.//

#import <UIKit/UIKit.h>
#import "JKGroupModel.h"
@protocol HeaderViewDelegate <NSObject>
@optional
- (void)clickView;

@end

@interface HeaderView : UITableViewHeaderFooterView
@property (nonatomic, assign) id<HeaderViewDelegate> delegate;

@property (nonatomic, strong) JKGroupModel *groupModel;
+ (instancetype)headerView:(UITableView *)tableView;
@end
