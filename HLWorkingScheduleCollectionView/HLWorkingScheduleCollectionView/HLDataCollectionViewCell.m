//
//  HLDataCollectionViewCell.m
//  HLWorkingScheduleCollectionView
//
//  Created by asd on 2018/3/27.
//  Copyright © 2018年 HLRen. All rights reserved.
//
#define KRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]/**随机颜色*/
#import "HLDataCollectionViewCell.h"
#import <Masonry.h>

@implementation HLDataCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor =  KRandomColor;
    self.cellLabel = [UILabel new];
    [self.contentView addSubview:self.cellLabel];
    self.cellLabel.textAlignment = 1;
    [self.cellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIView * lineView = [UIView new];
    [self.contentView addSubview:lineView];
    lineView.backgroundColor = KRandomColor;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(0);
        make.width.mas_equalTo(1);
    }];
    
    
    
    
}
@end
