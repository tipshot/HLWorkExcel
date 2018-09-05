//
//  HLCollectionViewCell.m
//  HLWorkingScheduleCollectionView
//
//  Created by asd on 2018/3/27.
//  Copyright © 2018年 HLRen. All rights reserved.
//
#define KRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]/**随机颜色*/

#import "HLCollectionViewCell.h"
#import <Masonry.h>

@implementation HLCollectionViewCell
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
    [self.cellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    
    
    self.coverBtn = [UIButton new];
    [self.contentView addSubview:self.coverBtn];
    [self.coverBtn addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.coverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    
    
}
- (void)coverBtnClick:(UIButton*)sender
{
    if (self.coverBtnBlock) {
        self.coverBtnBlock();
    }
}

@end
