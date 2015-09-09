//
//  VerticalScrollView.h
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VerticalScrollView;

@protocol VerticalScrollViewDelegate <NSObject>

-(void)tabBar:(VerticalScrollView *)tabBar didSelectedFromButtonIndex:(int)fromButtonIndex toButtonIndex:(int)toButtonIndex;

@end



@interface VerticalScrollView : UIScrollView

- (void)setBtnClickWithTag:(NSInteger)tag;

//设置代理属性
@property (nonatomic ,weak)id<VerticalScrollViewDelegate,UIScrollViewDelegate> delegate;

//通过item添加一个按钮
@property(nonatomic,strong)NSArray *BtnArray;


@end
