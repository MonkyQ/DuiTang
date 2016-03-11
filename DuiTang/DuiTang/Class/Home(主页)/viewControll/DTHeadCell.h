//
//  DTHeadCell.h
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTBigModelFrame;

@interface DTHeadCell : UICollectionViewCell
+(id)headCellWithNibWithCollnectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic ,strong)DTBigModelFrame * model;
@end
