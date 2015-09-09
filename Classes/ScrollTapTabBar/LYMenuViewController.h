//
//  LYMenuViewController.h
//  GiftGuide
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LYMenuViewControllerDelegate <NSObject>

-(void)menuViewController:(id)vc currentPageChanged:(NSInteger)pageIndex;

@end

@interface LYMenuViewController : UIViewController

@property(nonatomic,assign) id<LYMenuViewControllerDelegate>delegate;

-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titleArray vcArray:(NSArray *)vcArray;

-(id)initViewControllerWithTitleArray:(NSArray *)titleArray vcArray:(NSArray*)vcArray;

@end
