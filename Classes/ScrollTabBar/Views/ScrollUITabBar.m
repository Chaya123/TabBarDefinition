//
//  ScrollUITabBar.m
//  02-CustomTabBar
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "ScrollUITabBar.h"
#import "LCJScrollButton.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define TabBarH 49.0f
#define ConstentButtonW 75.0f


@interface ScrollUITabBar ()

//记录选中的button
@property (nonatomic ,weak)LCJScrollButton * selectedButton;

@end


@implementation ScrollUITabBar

#pragma mark - initWithFrame方法（设置frame）
//这个设置应该是在tabbar内部实现的（外界不应该知道）
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        //设置frame
        CGFloat tabbarX=50;
        CGFloat tabbarW=ScreenW -100;
        CGFloat tabbarH=TabBarH;
//        CGFloat tabbarY=ScreenH-tabbarH;
        //把tabbar放到上面（navigationBar的下面）
        CGFloat tabbarY=0.0f;
        self.frame=CGRectMake(tabbarX, tabbarY, tabbarW, tabbarH);
        //背景颜色
        self.backgroundColor=[UIColor whiteColor];
        //不会回弹
        self.bounces=NO;
        
    }
    return self;
}


#pragma mark - 添加按钮方法
-(void)addScrollButtonWithItem:(UITabBarItem *)item
{
    LCJScrollButton * button=[[LCJScrollButton alloc]init];
    button.item=item;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}


#pragma mark - button监听事件
-(void)buttonClick:(LCJScrollButton *)button
{
    //执行代理方法
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedFromButtonIndex:toButtonIndex:)]) {
        [self.delegate tabBar:self didSelectedFromButtonIndex:(int)self.selectedButton.tag toButtonIndex:(int)button.tag];
    }
    //将选中的button赋值给selectedButton
    self.selectedButton.selected=NO;
    button.selected=YES;
    self.selectedButton=button;
}

#warning 可以通过此地方改变每行最多显示的个数
#pragma mark - 子视图布局
-(void)layoutSubviews
{
    //注：因为scrollView到最后（注意不是一开始！！！）还会自动添加2个subviews（横向和纵向的条），所以要剪2
    int count=(int)self.subviews.count-2;
    //个数小于5个，那么均分
    if (count<=4) {
        for (int i=0; i<count; i++) {
            LCJScrollButton * button=(LCJScrollButton *)self.subviews[i];
            //frame设置
            CGFloat buttonW=self.bounds.size.width/count;
            CGFloat buttonH=self.bounds.size.height;
            CGFloat buttonX=i*buttonW;
            CGFloat buttonY=0;
            button.tag=i;
            button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        }
    }
    //超过5个（至少6个），这个时候buttonW是固定的75
    else
    {
        for (int i=0; i<count; i++) {
            LCJScrollButton * button=(LCJScrollButton *)self.subviews[i];
            //frame设置
            CGFloat buttonW=ConstentButtonW;
            CGFloat buttonH=self.bounds.size.height;
            CGFloat buttonX=i*buttonW;
            CGFloat buttonY=0;
            button.tag=i;
            button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        }
        //设置contentSize
        self.contentSize=CGSizeMake(count*ConstentButtonW, self.bounds.size.height);
    }
    
    //第一次layoutSubviews的时候（因为在滑动scrollview的时候，就会重复布局子视图），默认选中第一个按钮（以及对应的视图）
    //布局完的时候，点击第一个按钮（这样，是在全部视图都加载上了之后点击的，所以，按钮对应的view也会提到前面）
    static int num=1;
    if (num == 1) {
        [self buttonClick:self.subviews[0]];
        num++;
    }
    

}

@end
