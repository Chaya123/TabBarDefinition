//
//  VerticalCollectionViewCell.m
//  TabBarDefinition
//
//  Created by liu on 15-1-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "VerticalCollectionViewCell.h"

@interface VerticalCollectionViewCell()

@property(nonatomic,weak)UILabel *label;

@end

@implementation VerticalCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor cyanColor];
        UILabel *label  = [[UILabel alloc]initWithFrame:self.bounds];
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        self.label = label;
        [self.contentView addSubview:label];
    }
    
    return self;


}

- (void)setLabelTitle:(NSString *)labelTitle
{
    _labelTitle = labelTitle;
    
    self.label.text = labelTitle;

}


@end
