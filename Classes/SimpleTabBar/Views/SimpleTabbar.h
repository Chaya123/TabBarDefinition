//
//  SimpleTabbar.h
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SimpleTabbar;

@protocol SimpleTabbarDelegate <NSObject>

-(void)tabBar:(SimpleTabbar *)tabBar didSelectedFromButtonIndex:(int)fromButtonIndex toButtonIndex:(int)toButtonIndex;

@end



@interface SimpleTabbar : UIView

//设置代理属性
@property (nonatomic ,weak)id<SimpleTabbarDelegate> delegate;

//通过item添加一个按钮
-(void)addSimpleButtonWithItem:(UITabBarItem *)item;


@end
