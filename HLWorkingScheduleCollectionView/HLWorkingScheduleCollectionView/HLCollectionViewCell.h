//
//  HLCollectionViewCell.h
//  HLWorkingScheduleCollectionView
//
//  Created by asd on 2018/3/27.
//  Copyright © 2018年 HLRen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CoverBtnBlock)(void);

@interface HLCollectionViewCell : UICollectionViewCell
/**<#message#>*/
@property (nonatomic,strong) UILabel  * cellLabel;
/**<#message#>*/
@property (nonatomic,strong) UIButton * coverBtn;
/**<#message#>*/
@property (nonatomic,copy) CoverBtnBlock coverBtnBlock;
@end
