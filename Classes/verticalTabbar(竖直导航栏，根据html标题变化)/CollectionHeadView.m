//
//  CollectionHeadView.m
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//头视图改变

#import "CollectionHeadView.h"

@interface CollectionHeadView()


@property(nonatomic,weak)UILabel *titleLabel;


@end

@implementation CollectionHeadView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
       UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30)];
        label.textColor = [UIColor redColor];
        
        [self addSubview:label];
        
        _titleLabel = label;

        
    }
    return self;
}

- (void)setLabelTitle:(NSString *)labelTitle
{
    self.titleLabel.text = labelTitle;
}

//
//+ (id)headerWithCollectionView:(UICollectionView *)collectionView indexPath :(NSIndexPath *)indexPath
//{
//    NSString *ClassName = NSStringFromClass([self class]);
//    
//    [collectionView registerClass:[self class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ClassName];
//    
//    return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ClassName forIndexPath:indexPath];
//
//}

@end
