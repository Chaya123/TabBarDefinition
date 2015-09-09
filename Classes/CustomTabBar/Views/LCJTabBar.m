//
//  LCJTabBar.m
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "LCJTabBar.h"
#import "LCJUIbutton.h"

@interface LCJTabBar()
@property(nonatomic,strong)NSMutableArray *tabBarButtons;
@property(nonatomic,weak) LCJUIbutton *selectBtn;

@end

@implementation LCJTabBar

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    
    LCJUIbutton *button = [[LCJUIbutton alloc]init];
    //设置数据
    button.item = item;
    
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    //5.添加按钮到数组中
    [self.tabBarButtons addObject:button];
   
    //默认选择第0个按钮
    if (self.tabBarButtons.count == 1) {
        [self btnClick:button];
    }
}
- (void)btnClick:(LCJUIbutton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:(int)self.selectBtn.tag to:(int)btn.tag];
    }
    
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
  
    CGFloat buttonW = self.frame.size.width/self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    for (int index = 0; index<self.tabBarButtons.count; index++)
    {
        LCJUIbutton *button = self.tabBarButtons[index];
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = index;
    }
}



@end
