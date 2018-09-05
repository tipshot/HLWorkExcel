//
//  ViewController.m
//  HLWorkingScheduleCollectionView
//
//  Created by asd on 2018/3/26.
//  Copyright © 2018年 HLRen. All rights reserved.
//
#define KRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]/**随机颜色*/

#import "ViewController.h"
#import "HLScrollerView.h"
#import "HLDataCollectionViewCell.h"
#import <Masonry.h>
@interface ViewController ()<UITableViewDelegate,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)HLScrollerView * hlScrollerView;
@property (nonatomic,strong)UICollectionView * hlDataCollectionView;//日期的CollectionView
@property (nonatomic,strong)UITableView * hlTableView;
@property (nonatomic,strong)NSMutableArray * nameArray;//姓名数组
@property (nonatomic,strong)NSMutableArray * dataArray;//日期数组

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameArray = [NSMutableArray arrayWithObjects:@"李翠花",@"任大脸",@"魏总统",@"薛司机",@"路过",@"何举重",@"王莲花",@"焦麻子", nil];
    self.dataArray = [NSMutableArray arrayWithObjects:@"1/1",@"1/2",@"1/3",@"1/4",@"1/5",@"1/6",@"1/7",@"1/8",@"1/9",@"1/10",@"1/11",@"1/12",@"1/13",@"1/14",@"1/15",@"1/16",@"1/17",@"1/18",@"1/19",@"1/120",@"1/21",@"1/22",@"1/23",@"1/124",@"1/25",@"1/26",@"1/27",@"1/28",@"1/29",@"1/30",@"1/31", nil];
    [self setUpUI];
}


- (void)setUpUI
{
    
    UILabel * nameLabel = [UILabel new];
    [self.view addSubview:nameLabel];
    nameLabel.textAlignment = 1;
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:18];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(100);
    }];
    UIView * lineView = [UIView new];
    [nameLabel addSubview:lineView];
    lineView.backgroundColor = KRandomColor;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    
    _hlTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:_hlTableView];
    _hlTableView.backgroundColor = [UIColor orangeColor];
    _hlTableView.delegate = self;
    _hlTableView.dataSource = self;
    [_hlTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(100);
    }];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(70, 60);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.hlDataCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:self.hlDataCollectionView];
    self.hlDataCollectionView.delegate = self;
    self.hlDataCollectionView.dataSource = self;
    [self.hlDataCollectionView registerClass:[HLDataCollectionViewCell class] forCellWithReuseIdentifier:@"HLDataCollectionViewCell"];
    self.hlDataCollectionView.backgroundColor = KRandomColor;
    [self.hlDataCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(0);
        make.left.mas_equalTo(self.hlTableView.mas_right).offset(0);
        make.height.mas_equalTo(60);
    }];
    
    
    _hlScrollerView = [[HLScrollerView alloc]init];
    [self.view addSubview:_hlScrollerView];
    _hlScrollerView.delegate = self;
    _hlScrollerView.nameArray = self.nameArray;
    _hlScrollerView.dataArray = self.dataArray;
    [_hlScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.hlDataCollectionView.mas_bottom);
        make.left.mas_equalTo(_hlTableView.mas_right).offset(0);
    }];
    _hlScrollerView.contentSize = CGSizeMake(self.dataArray.count * 70, self.nameArray.count * 44);
    [_hlScrollerView creatCollectionView];
    

}


#pragma mark - UITableViewDelegate,UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"-------%@",scrollView);
    if (scrollView == _hlScrollerView) {
        _hlTableView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
        _hlDataCollectionView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    }else if (scrollView == _hlTableView){
        _hlScrollerView.contentOffset = CGPointMake(_hlScrollerView.contentOffset.x, scrollView.contentOffset.y);
        
    }else if (scrollView == _hlDataCollectionView){
        _hlScrollerView.contentOffset = CGPointMake(scrollView.contentOffset.x, _hlScrollerView.contentOffset.y);
    }
}
#pragma mark  - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HLDataCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HLDataCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    cell.cellLabel.text = self.dataArray[indexPath.row];
    cell.cellLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.text = self.nameArray[indexPath.row];
    return cell;
    
    
    
    
}



@end
