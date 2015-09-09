//
//  VerticalBtn.m
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "VerticalBtn.h"
#define TitleLabelRatio 0.9f
@implementation VerticalBtn

#pragma mark - initWithFrame方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        [self setImage:[UIImage imageNamed:@"1"] forState:UIControlStateSelected];
        //imageView和title字体居中
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        //title字体颜色和大小
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.titleLabel.font=[UIFont boldSystemFontOfSize:13];
        
    }
    return self;
}


#pragma mark - image的rect方法
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat imageX= 0;
    
    CGFloat imageW=1;
    CGFloat imageH= self.bounds.size.height;
    
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

#pragma mark - title的rect方法
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX= 2 ;
    CGFloat titleW=self.bounds.size.width - 2 ;
    CGFloat titleH=self.bounds.size.height;
    CGFloat titleY= 0;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

#pragma mark - item的set方法（设置子控件属性）
-(void)setBtnTitle:(NSString *)btnTitle
{
    _btnTitle =btnTitle;
    
    [self setTitle:btnTitle forState:UIControlStateNormal];

    
}


@end
