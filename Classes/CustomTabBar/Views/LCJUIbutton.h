//
//  LCJUIbutton.h
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCJUIbutton : UIButton

//通过这个属性，设置button子控件（imageView，titleLabel）属性
@property (nonatomic ,weak)UITabBarItem * item;

@end
