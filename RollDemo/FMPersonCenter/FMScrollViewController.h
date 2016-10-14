//
//  FMScrollViewController.h
//  RollDemo
//
//  Created by 周发明 on 16/10/13.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMScrollViewController : UIViewController<UIScrollViewDelegate>
/**
 *  初始化方法
 *
 *  @param classes          tableView的控制器类名集合
 *  @param headerViewHeight 头部视图的高度
 *  @param navViewHeight    导航视图的高度
 *
 *  @return 返回一个实例
 */
- (instancetype)initWithClasses:(NSArray *)classes headerViewHeight:(CGFloat)headerViewHeight navViewHeight:(CGFloat)navViewHeight;
/**
 *  禁用init初始化方法
 */
- (instancetype)init NS_UNAVAILABLE;

@property(nonatomic, weak)UIScrollView *scrollView;
/**
 *  头部占位视图
 */
@property(nonatomic, weak)UIView *headerContentView;
/**
 *  导航占位视图
 */
@property(nonatomic, weak)UIView *navContentView;

@property(nonatomic, strong)NSArray *classes;

@end
