//
//  DTWaterFlowCell.h
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTWaterFrame;

@interface DTWaterFlowCell : UICollectionViewCell
@property (nonatomic ,strong)DTWaterFrame *model;
+(id)waterFlowCellWithNibWithCollnectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath;
@end
