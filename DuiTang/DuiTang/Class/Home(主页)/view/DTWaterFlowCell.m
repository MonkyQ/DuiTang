//
//  DTWaterFlowCell.m
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTWaterFlowCell.h"
#import "DTWaterModel.h"
#import "DTPhoto.h"
#import "DTWaterFrame.h"

#import "DTCommenView.h"

#import "UIImageView+webcache.h"
@interface DTWaterFlowCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet DTCommenView *commentView;

@end

@implementation DTWaterFlowCell
+(id)waterFlowCellWithNibWithCollnectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath{
    
    NSString * className=NSStringFromClass([self class]);
    
    
    
    UINib * nib=[UINib nibWithNibName:className bundle:nil];
    
    [collectionView registerNib:nib forCellWithReuseIdentifier:className];
    DTWaterFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:className forIndexPath:indexPath];
  
    
    return cell;
    //XIB加载
   
    
}

-(void)setModel:(DTWaterFrame *)model
{
    _model = model;
    self.backgroundColor = DTRandomColor ;
    DTWaterModel *waterModel = model.model;
    DTPhoto *photo = waterModel.photo;
    NSString * str = [photo.path stringByReplacingOccurrencesOfString:@"_webp" withString:@""];

  // NSLog(@"%@",str);

    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:str] ];
    self.iconImage.frame = model.iconFrame;
    
    self.contentLabel.text = waterModel.msg;
    self.contentLabel.numberOfLines = maxLine;
    self.contentLabel.frame = model.contentFrame;
    self.contentLabel.font = otherFont;
    
    self.commentView.model = waterModel;
    self.commentView.frame = model.commentFrame;
    
    
}

@end
