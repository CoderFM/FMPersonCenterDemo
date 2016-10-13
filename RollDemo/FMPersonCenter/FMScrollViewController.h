//
//  FMScrollViewController.h
//  RollDemo
//
//  Created by 周发明 on 16/10/13.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMScrollViewController : UIViewController<UIScrollViewDelegate>

- (instancetype)initWithClasses:(NSArray *)classes headerViewHeight:(CGFloat)headerViewHeight navViewHeight:(CGFloat)navViewHeight;

- (instancetype)init NS_UNAVAILABLE;

@property(nonatomic, weak)UIScrollView *scrollView;

@property(nonatomic, weak)UIView *headerContentView;

@property(nonatomic, weak)UIView *navContentView;

@property(nonatomic, strong)NSArray *classes;

@end
