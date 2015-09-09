//
//  LCJUIbutton.m
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "LCJUIbutton.h"

#define imageViewRatio 0.7f
#define titleLabelRatio 0.3f

@implementation LCJUIbutton

#pragma mark - initWithFrame方法，设置初始化一些只要设置一次的属性
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        //imageView和titleLabel居中
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        //设置字体颜色和大小
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.titleLabel.font=[UIFont boldSystemFontOfSize:12];
        
    }
    return self;
}


#pragma mark - 重新设置image的rect
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageWidth=self.bounds.size.width;
    CGFloat imageHeigh=self.bounds.size.height * imageViewRatio;
    CGFloat imageX=0;
    CGFloat imageY=0;
    return CGRectMake(imageX, imageY, imageWidth, imageHeigh);
}

#pragma mark - 重新设置titleLabel的rect
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleWidth=self.bounds.size.width;
    CGFloat titleHeigh=self.bounds.size.height * titleLabelRatio;
    CGFloat titleX=0;
    CGFloat titleY=self.bounds.size.height-titleHeigh;
    return CGRectMake(titleX, titleY, titleWidth, titleHeigh);
}

#pragma mark - item的set方法（设置属性）
-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    [self setTitle:item.title forState:UIControlStateNormal];
    
}

@end
