//
//  PersonCenterController.m
//  RollDemo
//
//  Created by 周发明 on 16/10/13.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "PersonCenterController.h"
#import "HeaderView.h"

@interface PersonCenterController ()

@property(nonatomic, weak)HeaderView *headerView;

@property(nonatomic, weak)UISegmentedControl *segment;

@end

@implementation PersonCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.headerView.frame = self.headerContentView.bounds;
    self.segment.frame = self.navContentView.bounds;
}

- (void)segmentValueChange:(UISegmentedControl *)segment{
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.bounds.size.width * segment.selectedSegmentIndex, 0) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.segment.selectedSegmentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
}

- (HeaderView *)headerView{
    
    if (_headerView == nil) {
        
        HeaderView *header = [HeaderView viewForXib];
        [self.headerContentView addSubview:header];
        _headerView = header;
        
    }
    return _headerView;
}

- (UISegmentedControl *)segment{
    if (_segment == nil) {
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (int i = 0; i < self.classes.count; i++) {
            
            [arrM addObject:[NSString stringWithFormat:@"第%d个", i]];
        }
        
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:arrM];
        
        segment.selectedSegmentIndex = 0;
        
        [segment addTarget:self action:@selector(segmentValueChange:) forControlEvents:UIControlEventValueChanged];
        
        [self.navContentView addSubview:segment];
        
        _segment = segment;
        
    }
    return _segment;
}

@end
