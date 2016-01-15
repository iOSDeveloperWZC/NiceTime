//
//  SquareDynamicVC.m
//  Nice Time
//
//  Created by 王宗成 on 16/1/10.
//  Copyright © 2016年 杭州信使网络科技. All rights reserved.
//

#import "SquareDynamicVC.h"

@implementation SquareDynamicVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    lable.textColor = [UIColor whiteColor];
    
    lable.font = [UIFont systemFontOfSize:23];
    lable.textAlignment = UITextAlignmentCenter;
    lable.text = @"Nice Time";
    self.navigationItem.titleView = lable;
}
@end
