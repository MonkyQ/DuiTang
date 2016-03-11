//
//  DTHeadCell.m
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTHeadCell.h"
#import "DTBigModelFrame.h"
#import "DTBigModel.h"
#import "UIImageView+webcache.h"

@interface DTHeadCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
@implementation DTHeadCell


+(id)headCellWithNibWithCollnectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath{
    
    NSString * className=NSStringFromClass([self class]);
    
    
    
    UINib * nib=[UINib nibWithNibName:className bundle:nil];
    
    [collectionView registerNib:nib forCellWithReuseIdentifier:className];
    
    return [collectionView dequeueReusableCellWithReuseIdentifier:className forIndexPath:indexPath];
    
    //XIB加载
 
    
}


-(void)setModel:(DTBigModelFrame *)model
{
    _model = model;
    DTBigModel *bModel =model.model;
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:bModel.image_url]];
    
    self.titleLabel.text = bModel.des;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.frame = model.titleFrame;
    
    self.contentLabel.text = bModel.stitle;
    //NSLog(@"%@",bModel.stitle);
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.font = otherFont;
    self.contentLabel.textColor = [UIColor whiteColor];

    self.contentLabel.frame = model.contentFrame;
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconImage.frame = self.bounds;
    
    
    
}

@end
