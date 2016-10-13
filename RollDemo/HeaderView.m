//
//  HeaderView.m
//  RollDemo
//
//  Created by 周发明 on 16/10/13.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

+ (instancetype)viewForXib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
