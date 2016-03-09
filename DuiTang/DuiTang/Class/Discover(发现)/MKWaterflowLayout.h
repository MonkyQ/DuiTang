//
//  MKWaterflowLayout.h
//  瀑布流
//
//  Created by Monky on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKWaterflowLayout;

@protocol  MKWaterflowLayoutDelegate<NSObject>

@required
- (CGFloat)waterflowLayout:(MKWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInWaterflowLayout:(MKWaterflowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(MKWaterflowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(MKWaterflowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(MKWaterflowLayout *)waterflowLayout;

@end
@interface MKWaterflowLayout : UICollectionViewLayout

@property (nonatomic,weak)id<MKWaterflowLayoutDelegate>delegate;
@end
