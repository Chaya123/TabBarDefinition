//
//  ScrollUITabBar.h
//  02-CustomTabBar
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollUITabBar;

@protocol ScrollUITabBarDelegate <NSObject>

-(void)tabBar:(ScrollUITabBar *)tabBar didSelectedFromButtonIndex:(int)fromButtonIndex toButtonIndex:(int)toButtonIndex;

@end



@interface ScrollUITabBar : UIScrollView

//设置代理属性
@property (nonatomic ,weak)id<ScrollUITabBarDelegate,UIScrollViewDelegate> delegate;

//通过item添加一个按钮
-(void)addScrollButtonWithItem:(UITabBarItem *)item;

@end
