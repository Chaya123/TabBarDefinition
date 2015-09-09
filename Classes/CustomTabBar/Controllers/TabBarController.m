//
//  TabBarController.m
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "TabBarController.h"
#import "LCJTabBar.h"

@interface TabBarController ()<LCJTabBarDelegate>

@property(nonatomic,weak)LCJTabBar *customTabBar;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomTabbar];
    
    [self setupAllChildController];
}

#pragma mark - 将原始的tabBar上子视图移除
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews)
    {
        if ([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];
        }
    }
    
}
- (void)setupCustomTabbar
{
    if (_customTabBar == nil)
    {
        LCJTabBar *customTabBar = [[LCJTabBar alloc]init];
        customTabBar.frame = self.tabBar.bounds;
        customTabBar.delegate = self;
        [self.tabBar addSubview:customTabBar];
        _customTabBar = customTabBar;

    }
}
#pragma tabBar代理方法
- (void)tabBar:(LCJTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}


#pragma mark - 初始化子控制器，可以在这里改不同的子控制器及其图片文字
- (void)setupAllChildController
{
    
    UIViewController *home = [[UIViewController alloc]init];
    home.view.backgroundColor = [UIColor redColor];
    home.title = @"home";
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
 
    UIViewController *message = [[UIViewController alloc]init];
    message.title = @"message";
    message.view.backgroundColor = [UIColor grayColor];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectImageName:@"tabbar_message_center_selected"];
    
    UIViewController *discover = [[UIViewController alloc]init];
    discover.title = @"discover";
    discover.view.backgroundColor = [UIColor blueColor];
    [self setupChildViewController:discover title:@"发现" imageName:@"tabbar_discover" selectImageName:@"tabbar_discover_selected"];
    
    UIViewController *mine = [[UIViewController alloc]init];
    mine.title = @"title";
    mine.view.backgroundColor = [UIColor greenColor];
    [self setupChildViewController:mine title:@"我" imageName:@"tabbar_profile" selectImageName:@"tabbar_profile_selected"];
}

-(void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    //将item赋值并传给自定义TabBar
    UITabBarItem * item = [[UITabBarItem alloc]init];
    item.title = title;
    item.image = [UIImage imageNamed:imageName];
    item.selectedImage = [[UIImage imageNamed:selectImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置控制器属性
//    childVc.title = title;
//    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
//    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
    [self.customTabBar addTabBarButtonWithItem:item];
}

@end
