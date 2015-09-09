//
//  LYLoveGiftRootController.m
//  GiftGuide
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "LYLoveGiftRootController.h"
#import "LYMenuViewController.h"
#import "LYOneViewController.h"
#import "LYTwoController.h"

@interface LYLoveGiftRootController ()


@property(nonatomic,strong)LYMenuViewController *menuvc;


@end

@implementation LYLoveGiftRootController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    LYOneViewController *marsterVc = [[LYOneViewController alloc]init];

    LYTwoController*dynamicVc = [[LYTwoController alloc]init];
    
    LYOneViewController *marsterVc1 = [[LYOneViewController alloc]init];
    
    LYTwoController*dynamicVc2 = [[LYTwoController alloc]init];
    NSArray *titleArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    NSArray *vcArray = @[marsterVc, dynamicVc,marsterVc1,dynamicVc2,marsterVc,marsterVc1,dynamicVc2,marsterVc];
    _menuvc = [[LYMenuViewController alloc] initViewControllerWithTitleArray:titleArray vcArray:vcArray];
    _menuvc.view.frame = CGRectMake(0, 20, self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height - 20 - 49);
    [self.view addSubview:_menuvc.view];

}


@end
