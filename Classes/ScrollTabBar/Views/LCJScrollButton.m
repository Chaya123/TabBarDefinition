//
//  LCJScrollButton.m
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "LCJScrollButton.h"
#define ImageViewRatio 0.7f
#define TitleLabelRatio 0.3f
@implementation LCJScrollButton

#pragma mark - initWithFrame方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        //imageView和title字体居中
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        //title字体颜色和大小
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        self.titleLabel.font=[UIFont boldSystemFontOfSize:11];
        
    }
    return self;
}


#pragma mark - image的rect方法
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX=0;
    CGFloat imageY=0;
    CGFloat imageW=self.bounds.size.width;
    CGFloat imageH=self.bounds.size.height*ImageViewRatio;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

#pragma mark - title的rect方法
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX=0;
    CGFloat titleW=self.bounds.size.width;
    CGFloat titleH=self.bounds.size.height*TitleLabelRatio;
    CGFloat titleY=self.bounds.size.height-titleH;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

#pragma mark - item的set方法（设置子控件属性）
-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
}


@end
