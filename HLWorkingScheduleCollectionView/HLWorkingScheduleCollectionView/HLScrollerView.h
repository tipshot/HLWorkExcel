//
//  HLScrollerView.h
//  HLWorkingScheduleCollectionView
//
//  Created by asd on 2018/3/26.
//  Copyright © 2018年 HLRen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLScrollerView : UIScrollView
- (void)creatCollectionView;
@property (nonatomic,strong)NSMutableArray * nameArray;//姓名数组
@property (nonatomic,strong)NSMutableArray * dataArray;//日期数组
@end
