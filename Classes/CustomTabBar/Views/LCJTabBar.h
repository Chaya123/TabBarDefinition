//
//  LCJTabBar.h
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCJTabBar;
@protocol LCJTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LCJTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to;
@end

@interface LCJTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property(nonatomic,weak)id<LCJTabBarDelegate> delegate;


@end
