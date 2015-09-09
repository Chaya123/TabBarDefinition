//
//  LYMenuViewController.m
//  GiftGuide
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "LYMenuViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define ConstentButtonW 75.0f
//menu button tag值
#define BUTTON_TAG 100
//menu button 前景色
#define menuButton_bf_Color [UIColor redColor]

@interface LYMenuViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) NSArray *titleArray;
@property(nonatomic, strong)NSArray *vcArray;
@end

@implementation LYMenuViewController
{
    
    UIView * _scrollbuttonBackView;
    UIScrollView * _headerScrollView;
    UICollectionView * _collectionView;

}

#pragma mark init

-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titleArray vcArray:(NSArray *)vcArray
{
    self = [super init];
    self.view.frame = frame;
    if(self)
    {
        self.titleArray = titleArray;
        self.vcArray = vcArray;
        [self setMenuBar];
        [self setCollectionView];
    }
    return self;
}
-(id)initViewControllerWithTitleArray:(NSArray *)titleArray vcArray:(NSArray*)vcArray
{
    self = [super init];
    if(self)
    {
        self.view.backgroundColor = [UIColor redColor];
        self.titleArray = titleArray;
        self.vcArray = vcArray;
        [self setMenuBar];
        [self setCollectionView];
    }
    return self;
}

#pragma mark 生命周期
- (void)viewDidLoad {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

#pragma mark UI
#warning 可以通过此地方改变每行最多显示的个数
-(void)setMenuBar
{
    _headerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , 40)];
    _headerScrollView.pagingEnabled = NO;
    _headerScrollView.bounces = NO;
    [self.view addSubview:_headerScrollView];
    
    
    int count=(int)self.titleArray.count;
    
    int i = 0;
    //个数小于5个，那么均分
    if (count<=5) {
        _headerScrollView.contentSize = _headerScrollView.frame.size;
        for (NSString *title in self.titleArray) {
            CGFloat buttonW=self.view.frame.size.width/count;
            CGFloat buttonH= _headerScrollView.frame.size.height;
            CGFloat buttonX=i*buttonW;
            CGFloat buttonY=0;
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY,buttonW, buttonH)];
            [button setTitle:title forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            
            [button setBackgroundColor:[UIColor whiteColor]];
            
            button.tag = BUTTON_TAG + i;
            if (button.tag == BUTTON_TAG) {
                button.selected = YES;
            }
            [button addTarget:self action:@selector(setSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
            [_headerScrollView addSubview:button];
            i++;

        }
    }
    //超过5个（至少6个），这个时候buttonW是固定的75
    else
    {
        for (NSString *title in self.titleArray) {

            CGFloat buttonW=ConstentButtonW;
            CGFloat buttonH=_headerScrollView.frame.size.height;;
            CGFloat buttonX=i*buttonW;
            CGFloat buttonY=0;
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY,buttonW, buttonH)];
            [button setTitle:title forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            
            [button setBackgroundColor:[UIColor whiteColor]];
            
            button.tag = BUTTON_TAG + i;
            if (button.tag == BUTTON_TAG) {
                button.selected = YES;
            }
            [button addTarget:self action:@selector(setSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
            [_headerScrollView addSubview:button];
            i++;
 
        }
        //设置contentSize
        _headerScrollView.contentSize = CGSizeMake(count*ConstentButtonW,_headerScrollView.frame.size.height);
    }
    //设置红线
      [self createMenuButtonForeground];
    
}

-(void)createMenuButtonForeground
{
    UIButton *button = (UIButton*)[_headerScrollView viewWithTag:BUTTON_TAG];
    _scrollbuttonBackView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame) - 2, CGRectGetWidth(button.frame), 2)];
    _scrollbuttonBackView.backgroundColor = menuButton_bf_Color;
    [_headerScrollView addSubview:_scrollbuttonBackView];
}

-(void)setupMenuButtonForeground:(UIButton*)button
{
    CGRect frame = CGRectMake(CGRectGetMinX(button.frame), CGRectGetMaxY(button.frame) - 2, CGRectGetWidth(button.frame), 2);
    _scrollbuttonBackView.frame = frame;
}

-(void)setSelectedButton:(UIButton *)button
{
    [button setSelected:YES];
    NSArray *subArray = _headerScrollView.subviews;
    for (UIButton *subbutton  in subArray) {
        if ([subbutton isKindOfClass:[UIButton class]]) {
            if (subbutton != button) {
                [subbutton setSelected:NO];
            }
        }
        
    }
     [self setupMenuButtonForeground:button];
    
    if ((button.tag - 100 < (self.titleArray.count -  3)  && (button.tag - 100 >0)) ) {
         [_headerScrollView setContentOffset:CGPointMake((button.tag - 101)* CGRectGetWidth(button.frame), 0)];
    }
   
    [_collectionView setContentOffset:CGPointMake((button.tag - 100)* CGRectGetWidth(self.view.frame), 0) animated:YES];
}

-(void)setCollectionView
{
    CGRect frame = CGRectMake(0, CGRectGetMaxY(_headerScrollView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetHeight(_headerScrollView.frame));
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    //设置滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置item size
    flowLayout.itemSize = frame.size;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    //设置是否页面滚动效果
    _collectionView.pagingEnabled = YES;
    _collectionView.bounces = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
}

#pragma mark CollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIViewController *vc = self.vcArray[indexPath.item];
    [self addChildViewController:vc];
    vc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:vc.view];
    //    [vc didMoveToParentViewController:self];
    
    return cell;
}


#pragma mark scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    NSInteger index = (NSInteger)floor((point.x / self.view.frame.size.width));
    UIButton *button = (UIButton*)[_headerScrollView viewWithTag:BUTTON_TAG + index];
    if (self.delegate != nil && [self.delegate conformsToProtocol:NSProtocolFromString(@"LYMenuViewControllerDelegate")]) {
        [self.delegate menuViewController:self currentPageChanged:index];
    }
    
    [self setSelectedButton:button];
}


@end
