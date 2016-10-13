//
//  ViewController.m
//  RollDemo
//
//  Created by 周发明 on 16/10/12.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "ViewController.h"
#import "PersonCenterController.h"
#import "FMScrollSubBaseController.h"

@interface ViewController ()

@property(nonatomic, weak)UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)button:(id)sender {
    
    PersonCenterController *roll = [[PersonCenterController alloc] initWithClasses:@[[FMScrollSubBaseController class], [FMScrollSubBaseController class], [FMScrollSubBaseController class]] headerViewHeight:200 navViewHeight:50];
    
    [self.navigationController pushViewController:roll animated:YES];
}

@end
