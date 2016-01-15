//
//  FirstPageVC.m
//  Nice Time
//
//  Created by 王宗成 on 16/1/10.
//  Copyright © 2016年 杭州信使网络科技. All rights reserved.
//

#import "FirstPageVC.h"
#import <AVOSCloud/AVOSCloud.h>
@implementation FirstPageVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    lable.textColor = [UIColor whiteColor];
    
    lable.font = [UIFont systemFontOfSize:23];
    lable.textAlignment = UITextAlignmentCenter;
    lable.text = @"Nice Time";
    self.navigationItem.titleView = lable;
//
//    AVObject *user = [AVObject objectWithClassName:@"MUser"];
////    [post setObject:@"王宗成" forKey:@"name"];
////    [post save];
//    [user setObject:@"男" forKey:@"sex"];
//    [user setObject:@22 forKey:@"age"];
//    [user setObject:@YES forKey:@"marry"];
//sW

    AVQuery *query = [AVQuery queryWithClassName:@"MUser"];
    AVObject *objectd = [query getObjectWithId:@"5696068b60b2d6907c9288b5"];
    
    NSLog(@"%@",[objectd objectForKey:@"marry"]);
    
    
}
@end
