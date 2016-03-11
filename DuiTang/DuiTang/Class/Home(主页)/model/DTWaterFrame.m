



//
//  DTWaterFrame.m
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTWaterFrame.h"
#import "DTWaterModel.h"
#import "DTPhoto.h"


@implementation DTWaterFrame


/**
 根据字体获得size的方法抽出
 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW str: (NSString *)str
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, 120);
    
    
    return [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}

-(void)setModel:(DTWaterModel *)model
{
    _model = model;
    DTPhoto *photo = model.photo;
    
    CGFloat W = [photo.width doubleValue];
    CGFloat H = [photo.height doubleValue];
    
      CGFloat iconX = 0;
      CGFloat iconY = 0;
      CGFloat iconW = (mainScreenWidth- (maxColum+1)*homePedding)/2;
      CGFloat iconH = iconW *H/W;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    CGFloat contentX = 0;
    CGFloat contentY = CGRectGetMaxY(self.iconFrame)+homePedding;
    CGSize contentSize = [self sizeWithFont:otherFont maxW:iconW str:model.msg];
    self.contentFrame = (CGRect){{contentX,contentY},contentSize};
    
    CGFloat comX = contentX;
    CGFloat comY = CGRectGetMaxY(self.contentFrame)+homePedding;
    CGFloat comW = iconW;
    CGFloat comH =25;
    self.commentFrame = CGRectMake(comX, comY, comW*4/5, comH);
    
    
    self.maxHight = CGRectGetMaxY(self.commentFrame);
}
@end
