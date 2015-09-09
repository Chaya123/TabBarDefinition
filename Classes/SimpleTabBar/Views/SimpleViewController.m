//
//  SimpleViewController.m
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "SimpleViewController.h"
#import "SimpleTabbar.h"

@interface SimpleViewController ()<SimpleTabbarDelegate>

//存储视图控制器
@property (nonatomic ,retain)NSMutableArray * viewControllersArray;

//存储视图控制器上对应的view
@property (nonatomic ,retain)NSMutableArray * viewsArray;

//自定义的滚动tabbar
@property (nonatomic ,weak)SimpleTabbar * simpleTabbar;

@end

@implementation SimpleViewController

#pragma mark - viewDidLoad方法
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建tabbar
    [self setScrollTabBar];
    [self setupAllChildController];
}

#pragma mark - viewWillAppear方法
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.view bringSubviewToFront:self.simpleTabbar];
}


#pragma mark - init方法
-(instancetype)init
{
    if (self=[super init]) {
        
        //创建array
        _viewControllersArray=[[NSMutableArray alloc]init];
        _viewsArray=[[NSMutableArray alloc]init];
        
    }
    return self;
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
    
    UIViewController *home1 = [[UIViewController alloc]init];
    home1.view.backgroundColor = [UIColor redColor];
    home1.title = @"home1";
    [self setupChildViewController:home1 title:@"首页" imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
    
    UIViewController *message1 = [[UIViewController alloc]init];
    message1.title = @"message1";
    message1.view.backgroundColor = [UIColor grayColor];
    [self setupChildViewController:message1 title:@"消息" imageName:@"tabbar_message_center" selectImageName:@"tabbar_message_center_selected"];
    
    UIViewController *discover1 = [[UIViewController alloc]init];
    discover1.title = @"discover1";
    discover1.view.backgroundColor = [UIColor blueColor];
    [self setupChildViewController:discover1 title:@"发现" imageName:@"tabbar_discover" selectImageName:@"tabbar_discover_selected"];
    
    UIViewController *mine1 = [[UIViewController alloc]init];
    mine1.title = @"title";
    mine1.view.backgroundColor = [UIColor greenColor];
    [self setupChildViewController:mine1 title:@"我" imageName:@"tabbar_profile" selectImageName:@"tabbar_profile_selected"];
}

-(void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    //将item赋值并传给自定义TabBar
    UITabBarItem * item = [[UITabBarItem alloc]init];
    item.title = title;
    item.image = [UIImage imageNamed:imageName];
    item.selectedImage = [[UIImage imageNamed:selectImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //包装一个导航控制器
    [_viewControllersArray addObject:childVc];
    [_viewsArray addObject:childVc.view];
    
    // UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childVc];
    
    //[self addChildViewController:nav];
    [self.view addSubview:childVc.view];
    
    [self.simpleTabbar addSimpleButtonWithItem:item];
}

#pragma mark - 创建tabbar
-(void)setScrollTabBar
{
    if (_simpleTabbar==nil) {
        SimpleTabbar * simpleTabbar=[[SimpleTabbar alloc]init];
        //设置代理
        simpleTabbar.delegate=self;
        [self.view addSubview:simpleTabbar];
        _simpleTabbar=simpleTabbar;
    }
}

#pragma mark - ScrollUITabBarDelegate代理方法
-(void)tabBar:(SimpleTabbar *)tabBar didSelectedFromButtonIndex:(int)fromButtonIndex toButtonIndex:(int)toButtonIndex
{
    [self.view bringSubviewToFront:self.viewsArray[toButtonIndex]];
    [self.view bringSubviewToFront:self.simpleTabbar];
}



@end
