//
//  VerticalViewController.m
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "VerticalViewController.h"
#import "VerticalScrollView.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "VerticalCollectionViewCell.h"
#import "CollectionHeadView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define headH 30

#define ItemW 305.0/3

@interface VerticalViewController ()<VerticalScrollViewDelegate,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,CHTCollectionViewDelegateWaterfallLayout>

//自定义的滚动tabbar
@property (nonatomic ,weak)VerticalScrollView * scrollTabBar;

@property(nonatomic,weak)UICollectionView *collectionView;

@property(nonatomic,strong)NSArray *dataArray;

@property(nonatomic,strong)NSArray *scrollBtnArray;

@property(nonatomic,strong)NSMutableArray *sectionHight;

@end

@implementation VerticalViewController

static NSString * const reuseIdentifier = @"VerticalCollectionViewCell";
static NSString * const reuseIdentifierHeader = @"CollectionHeadView";

#pragma mark -sectionHight懒加载
- (NSMutableArray *)sectionHight
{
    
    if (!_sectionHight) {
        _sectionHight = [NSMutableArray array];
        
    }
    return _sectionHight;
}
#pragma mark - 准备滚动视图的btn标题
- (NSArray *)scrollBtnArray
{
    if (!_scrollBtnArray) {
        _scrollBtnArray =@[@"个性配饰",@"美味厨房",@"美味礼物",@"数码小物",@"创意文具",@"美容护肤",@"精致彩妆",@"运动户外",@"身体保健",@"女装",@"箱包",@"女鞋",@"身体保健",@"女装",@"箱包",@"女鞋"];
    }
    return _scrollBtnArray;

}
#pragma mark -dataArray懒加载
- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSArray array];
        
    }

    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareDataSource];
    
    [self setScrollTabBar];
    
    [self setUpCollectionView];
}
#pragma mark - 准备数据源
- (void)prepareDataSource
{
    CGFloat senctionHight = 0;
    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction1 = @[@"抱枕/靠垫/坐垫",@"装饰画",@"钟表摆件",@"香蕉用品",@"收纳整理"];
 
   senctionHight += senction1.count % 3 == 0? (senction1.count / 3  * ItemW + headH) : ((senction1.count / 3 + 1 ) * ItemW + headH);
    [self.sectionHight addObject:@(senctionHight)];
  
    NSArray *senction2 = @[@"智能设备",@"鲜花蛋糕",@"书",@"模型拼图",@"底妆"];
    senctionHight += senction2.count % 3 == 0 ? (senction2.count / 3  * ItemW + headH): ((senction2.count / 3 + 1 ) * ItemW + headH);
    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction3 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    senctionHight += senction3.count % 3 == 0 ? (senction3.count / 3  * ItemW + headH): ((senction3.count / 3 + 1 ) * ItemW + headH);
    
    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction4 = @[@"11",@"22",@"33",@"44",@"55",@"66",@"77",@"88",@"99",@"10"];
    senctionHight += senction4.count % 3 == 0 ? (senction4.count / 3  * ItemW + headH): ((senction4.count / 3 + 1 ) * ItemW + headH);
    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction5 = @[@"智能设备",@"鲜花蛋糕",@"书",@"模型拼图",@"底妆"];
    senctionHight += senction5.count % 3 == 0 ? (senction5.count / 3  * ItemW + headH): ((senction5.count / 3 + 1 ) * ItemW + headH);
    [self.sectionHight addObject:@(senctionHight)];
    NSArray *senction6 = @[@"21",@"22",@"23"];
    senctionHight += senction6.count % 3 == 0 ? (senction6.count / 3  * ItemW + headH): ((senction6.count / 3 + 1 ) * ItemW + headH);

    [self.sectionHight addObject:@(senctionHight)];
    NSArray *senction7 = @[@"抱枕/靠垫/坐垫",@"24",@"25",@"26",@"27",@"28",@"29"];
    
    senctionHight += senction7.count % 3 == 0 ? (senction7.count / 3  * ItemW + headH): ((senction7.count / 3 + 1 ) * ItemW + headH);
  
    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction8 = @[@"智能设备",@"鲜花蛋糕",@"书",@"模型拼图",@"底妆"];
    
    senctionHight += senction8.count % 3 == 0 ? (senction8.count / 3  * ItemW + headH): ((senction8.count / 3 + 1 ) * ItemW + headH);

    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction9 = @[@"31",@"32",@"33",@"34",@"35",@"36"];
    senctionHight += senction9.count % 3 == 0 ? (senction9.count / 3  * ItemW + headH): ((senction9.count / 3 + 1 ) * ItemW + headH);

    [self.sectionHight addObject:@(senctionHight)];
    NSArray *senction10 = @[@"抱枕/靠垫/坐垫",@"装饰画",@"钟表摆件",@"香蕉用品",@"收纳整理"];
    senctionHight += senction10.count % 3 == 0 ? (senction10.count / 3  * ItemW + headH): ((senction10.count / 3 + 1 ) * ItemW + headH);

    [self.sectionHight addObject:@(senctionHight)];
    NSArray *senction11 = @[@"智能设备",@"鲜花蛋糕",@"书",@"模型拼图",@"底妆"];
    senctionHight += senction11.count % 3 == 0 ? (senction11.count / 3  * ItemW + headH): ((senction11.count / 3 + 1 ) * ItemW + headH);

    [self.sectionHight addObject:@(senctionHight)];
    NSArray *senction12 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"6",@"7",@"8",@"9"];
    senctionHight += senction12.count % 3 == 0 ? (senction12.count / 3  * ItemW + headH): ((senction12.count / 3 + 1 ) * ItemW + headH);
    
    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction13 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"6",@"7",@"8",@"9"];
    senctionHight += senction13.count % 3 == 0 ? (senction13.count / 3  * ItemW + headH): ((senction13.count / 3 + 1 ) * ItemW + headH);
    
    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction14 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"6",@"7",@"8",@"9"];
    senctionHight += senction14.count % 3 == 0 ? (senction14.count / 3  * ItemW + headH): ((senction14.count / 3 + 1 ) * ItemW + headH);
    
    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction15 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"6",@"7",@"8",@"9"];
    senctionHight += senction15.count % 3 == 0 ? (senction15.count / 3  * ItemW + headH): ((senction15.count / 3 + 1 ) * ItemW + headH);
    
    [self.sectionHight addObject:@(senctionHight)];
    
    NSArray *senction16 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"6",@"7",@"8",@"9"];
    senctionHight += senction16.count % 3 == 0 ? (senction16.count / 3  * ItemW + headH): ((senction16.count / 3 + 1 ) * ItemW + headH);
    
    [self.sectionHight addObject:@(senctionHight)];
    
    
    
    self.dataArray = @[senction1,senction2,senction3,senction4,senction5,senction6,senction7,senction8,senction9,senction10,senction11,senction12,senction13,senction14,senction15,senction16];

}

#pragma mark - 创建tabbar
-(void)setScrollTabBar
{
    if (_scrollTabBar==nil) {
        VerticalScrollView * scrollTabBar=[[VerticalScrollView alloc]init];
        //设置代理
        scrollTabBar.delegate=self;
        scrollTabBar.BtnArray = self.scrollBtnArray;
        [self.view addSubview:scrollTabBar];
        _scrollTabBar=scrollTabBar;
    }
}

- (void)setUpCollectionView
{
    CHTCollectionViewWaterfallLayout *fallLayout = [[CHTCollectionViewWaterfallLayout alloc]init];
    fallLayout.columnCount = 3;
    fallLayout.minimumColumnSpacing = 0;
    fallLayout.minimumInteritemSpacing = 0;
    
    fallLayout.headerHeight = 30;
    
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(70, 100, 305, 667 - 100) collectionViewLayout:fallLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:collectionView];
    self.collectionView = collectionView;

}
#pragma mark - tabbar的代理方法
- (void)tabBar:(VerticalScrollView *)tabBar didSelectedFromButtonIndex:(int)fromButtonIndex toButtonIndex:(int)toButtonIndex
{
    if (toButtonIndex < self.dataArray.count ) {
        CGFloat y = [self.sectionHight[toButtonIndex] floatValue] ;
        [self.collectionView setContentOffset:CGPointMake(0, y - 30) animated:YES];
    }

    NSLog(@"toButtonIndex = %d",toButtonIndex);

}
//使左边的scrollBar跟着collectionView滚动而滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    if ([scrollView isKindOfClass:[self.collectionView class]])
    {
        
        CGFloat offsent = scrollView.contentOffset.y;
       //遍历高度数组
    [self.sectionHight enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
        {
        if (idx < self.sectionHight.count - 1 )
        {
            CGFloat  daxiao;
            
            if (idx == 0) {
                daxiao = 30;
            }
            else
            {
            //得到本个obj的高度
            daxiao = [obj floatValue] - [self.sectionHight[idx - 1] floatValue] - 20;
            }
            //如果进入到obj的头部   ，btn选中改变
            if (offsent >=([obj floatValue] - daxiao) && offsent <= [self.sectionHight[idx+1] floatValue])
            {
                [self.scrollTabBar setBtnClickWithTag:idx];
            }
        }
       
        }];
    }
}



#pragma mark - collectionView的代理方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *array = self.dataArray[section];
    
    return array.count;
    
}
//返回item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    return CGSizeMake(ItemW,ItemW);
    
}


//定制collectionViewCell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView registerClass:[VerticalCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    VerticalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (self.dataArray.count>0) {
        NSArray *array = self.dataArray[indexPath.section];
        
        NSString *lableTitle = array[indexPath.row];
   
        //赋值并显示
        cell.labelTitle = lableTitle;
    }
    return cell;
}
//头部header
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
     [collectionView registerClass:[CollectionHeadView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifierHeader];
    
    CollectionHeadView *header = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifierHeader forIndexPath:indexPath];

    header.labelTitle = self.scrollBtnArray[indexPath.section];
    return header;

}


@end
