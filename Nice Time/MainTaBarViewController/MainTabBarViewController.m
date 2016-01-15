//
//  MainTabBarViewController.m
//  Nice Time
//
//  Created by 王宗成 on 16/1/10.
//  Copyright © 2016年 杭州信使网络科技. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "PersonCenterVC.h"
#import "FirstPageVC.h"
#import "SquareDynamicVC.h"
@implementation MainTabBarViewController
-(instancetype)init
{
    if (self = [super init]) {
        
        [self initView];
        [self initNav];
    }
    return self;
}

-(void)initNav
{
//    self.navigationController.navigationBar.translucent = YES;
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    lable.textColor = [UIColor whiteColor];
    
    lable.font = [UIFont systemFontOfSize:23];
    lable.textAlignment = UITextAlignmentCenter;
    lable.text = @"Nice Time";
    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
    self.navigationItem.titleView = lable;
}

-(void)initView
{
    FirstPageVC *vc1 = [[FirstPageVC alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    SquareDynamicVC *vc2 = [[SquareDynamicVC alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    PersonCenterVC *vc3 = [[PersonCenterVC alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];

    NSArray *array = [NSArray arrayWithObjects:nav1,nav2,nav3, nil];
    self.viewControllers = array;
    
    
    vc1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"btn_首页@2x.png"] selectedImage:[UIImage imageNamed:@"btn_首页1@2x.png"]];
    
    vc2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"大咖秀" image:[UIImage imageNamed:@"home_tab_icon_3@2x"] selectedImage:[UIImage imageNamed:@"home_tab_icon_3@2x"]];
    //btn_关于我们@2x.png
    vc3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"个人中心" image:[UIImage imageNamed:@"btn_我的@2x"] selectedImage:[UIImage imageNamed:@"btn_我的1@2x"]];
    
}
@end
