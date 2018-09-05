//
//  HLScrollerView.m
//  HLWorkingScheduleCollectionView
//
//  Created by asd on 2018/3/26.
//  Copyright © 2018年 HLRen. All rights reserved.
//
#define KRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]/**随机颜色*/
#import "HLScrollerView.h"
#import "HLCollectionViewCell.h"
#import <Masonry.h>
@interface HLScrollerView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UIView * leftView;
@property (nonatomic,strong)UICollectionView * hlCollectionView;
@end
@implementation HLScrollerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor redColor];
    
    UILabel * Label = [UILabel new];
    [self addSubview:Label];
    Label.text = @"label";
    Label.frame = CGRectMake(10, 10, 100, 100);

    
//    [self creatCollectionView];

}


- (void)creatCollectionView
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(70, 44);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.hlCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self addSubview:self.hlCollectionView];
    self.hlCollectionView.delegate = self;
    self.hlCollectionView.dataSource  =self;
    self.hlCollectionView.scrollEnabled = NO;
    self.hlCollectionView.backgroundColor = KRandomColor;
    [self.hlCollectionView registerClass:[HLCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.hlCollectionView.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
    
    
    
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.nameArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 3;
    }else if (section == 1){
        return 1;
    }else{
        return self.dataArray.count;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HLCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    cell.backgroundColor = KRandomColor;
    cell.cellLabel.text = [NSString stringWithFormat:@"%ld组%ld行",indexPath.section,indexPath.row];
    cell.coverBtnBlock = ^{
        NSLog(@"姓名 = %@，日期 = %@",self.nameArray[indexPath.section],self.dataArray[indexPath.row]);
    };
    return cell;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"姓名 = %@，日期 = %@",self.nameArray[indexPath.section],self.dataArray[indexPath.row]);
}











@end
