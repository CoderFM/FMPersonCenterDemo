//
//  FMScrollViewController.m
//  RollDemo
//
//  Created by 周发明 on 16/10/13.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "FMScrollViewController.h"
#import "FMScrollSubBaseController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface FMScrollViewController ()

@property(nonatomic, assign)BOOL isLoadChilds;

@property(nonatomic, assign)CGFloat headerViewHeight;

@property(nonatomic, assign)CGFloat navViewHeight;

@end

@implementation FMScrollViewController

- (instancetype)initWithClasses:(NSArray *)classes headerViewHeight:(CGFloat)headerViewHeight navViewHeight:(CGFloat)navViewHeight{
    
    if (self = [super init]) {
        self.classes = classes;
        self.headerViewHeight = headerViewHeight;
        self.navViewHeight = navViewHeight;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_fmscrollSubBaseTableScrollNoti:) name:FMScrollSubBaseTableScrollNotiKey object:nil];
    
    [self scrollView];
    [self headerContentView];
    [self navContentView];
    
}

- (void)initSubChildController{
    
    if (self.isLoadChilds) return;
    
    self.isLoadChilds = YES;
    
    for (int i = 0; i < 3; i++) {
        
        FMScrollSubBaseController *table = [[FMScrollSubBaseController alloc] initWithHeaderViewHeight:self.headerViewHeight navHeight:self.navViewHeight];
        
        table.view.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
        
        [self addChildViewController:table];
        
        [self.scrollView addSubview:table.view];
        
    }
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.scrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    [self initSubChildController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_fmscrollSubBaseTableScrollNoti:(NSNotification *)noti{
    
    CGFloat offsetY = [noti.object floatValue];
    
    if (offsetY > self.headerViewHeight) {
        offsetY = self.headerViewHeight;
    }
    
    CGRect frame = self.headerContentView.frame;
    
    frame.origin.y = - offsetY + 64;
    
    self.headerContentView.frame = frame;
    
    CGRect navFrame = self.navContentView.frame;
    
    navFrame.origin.y = - offsetY + 64 + self.headerViewHeight;
    
    self.navContentView.frame = navFrame;
}

- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.backgroundColor = [UIColor redColor];
        scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT - 64);
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.bounces = NO;
        [self.view addSubview:scrollView];
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (UIView *)headerContentView{
    
    if (_headerContentView == nil) {
        
        UIView *headerView = [[UIView alloc] init];
        
        headerView.backgroundColor = [UIColor redColor];
        
        headerView.frame = CGRectMake(0, 64, SCREEN_WIDTH, self.headerViewHeight);
        
        [self.view addSubview:headerView];
        
        _headerContentView = headerView;
        
    }
    return _headerContentView;
}

- (UIView *)navContentView{
    if (_navContentView == nil) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor orangeColor];
        view.frame = CGRectMake(0, 64 + self.headerViewHeight, SCREEN_WIDTH, self.navViewHeight);
        [self.view addSubview:view];
        _navContentView = view;
    }
    return _navContentView;
}

@end
