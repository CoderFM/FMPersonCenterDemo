//
//  FMScrollSubController.m
//  RollDemo
//
//  Created by 周发明 on 16/10/13.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "FMScrollSubBaseController.h"

@interface FMScrollSubBaseController ()

@property(nonatomic, assign)CGFloat headerViewHeight;

@property(nonatomic, assign)CGFloat navHeight;

@end

@implementation FMScrollSubBaseController

- (instancetype)initWithHeaderViewHeight:(CGFloat)headerViewHeight navHeight:(CGFloat)navHeight{
    
    if (self = [super init]) {
        self.headerViewHeight = headerViewHeight;
        self.navHeight = navHeight;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initHeaderView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_fmscrollSubBaseTableScrollNoti:) name:FMScrollSubBaseTableScrollNotiKey object:nil];
    
    // Do any additional setup after loading the view.
}

- (void)initHeaderView{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.headerViewHeight + self.navHeight)];
    
    self.tableView.tableHeaderView = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.textLabel.text = [NSString stringWithFormat:@"%ld楼", indexPath.row];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
}
- (UITableView *)tableView{
    
    if (_tableView == nil) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        
        _tableView = tableView;
        
    }
    return _tableView;
}
/**
 *  滚动, 发送通知
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [[NSNotificationCenter defaultCenter] postNotificationName:FMScrollSubBaseTableScrollNotiKey object:@(scrollView.contentOffset.y)];
}
/**
 *  其他列表滚动, 监听通知, 改变y轴的偏移量
 */
- (void)_fmscrollSubBaseTableScrollNoti:(NSNotification *)noti{
    CGFloat offsetY = [noti.object floatValue];
    if (offsetY < self.headerViewHeight) {
        /* 滚动的tableView的头部视图是在屏幕范围内的
        此时其他列表的y值偏移量, 与当前滚动的这个列表的偏移量是一样的
         */
        self.tableView.contentOffset = CGPointMake(0, offsetY);
    }  else {
        /*
         此时头部视图已不再屏幕显示的范围上
         需要判断的是, 当前这个列表的偏移, 是不是已经在正好滚动到上面(也就是导航View的下面), 如果是小于这个头部视图的, 要让它滚动到导航视图的下面, 否则不用管,
         这里如果不判断的话, 快速滚动, 再去看其他列表, 会出现, 第一个Cell的顶部, 与导航View中间有间距
         */
        if (self.tableView.contentOffset.y < self.headerViewHeight) {
            self.tableView.contentOffset = CGPointMake(0, self.headerViewHeight);
        }
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
