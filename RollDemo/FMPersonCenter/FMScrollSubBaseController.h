//
//  FMScrollSubController.h
//  RollDemo
//
//  Created by 周发明 on 16/10/13.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FMScrollSubBaseTableScrollNotiKey @"FMScrollSubBaseTableScrollNotiKey"

#define FMScrollSubBaseTableScrollOffsetKey @"FMScrollSubBaseTableScrollOffsetKey"

@interface FMScrollSubBaseController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, weak)UITableView *tableView;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithHeaderViewHeight:(CGFloat)headerViewHeight navHeight:(CGFloat)navHeight;

@end
