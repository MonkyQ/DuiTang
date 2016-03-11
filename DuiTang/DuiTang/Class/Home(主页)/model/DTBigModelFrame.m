//
//  DTBigModelFrame.m
//  DuiTang
//
//  Created by 苏威 on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTBigModelFrame.h"
#define maxWidth 275


#define  screenW [UIScreen mainScreen].bounds.size.width;


@implementation DTBigModelFrame
/**
 根据字体获得size的方法抽出
 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW str: (NSString *)str
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    
    return [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}
-(void)setModel:(DTBigModel *)model
{
    _model = model;
    
    
    CGFloat oriX = 0;
    CGFloat oriY = homePedding;
    CGFloat oriW = mainScreenWidth;
    CGFloat oriH = 0;
    
    CGFloat imageW = screenW;
    CGFloat imageH = 180;
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    
    self.iconFrame= CGRectMake(imageX, imageY, imageW, imageH);
    
    
    
    CGFloat titleX = homePedding;
    CGFloat titleY = 100;
    CGSize titleSize = [self sizeWithFont:titleFont maxW:maxWidth str:model.des];
    self.titleFrame = (CGRect){{titleX,titleY},titleSize};
    
    
    CGFloat contentX = titleX;
    CGFloat contentY = homePedding+CGRectGetMaxY(self.titleFrame);
    CGSize contentSize = [self sizeWithFont:otherFont maxW:maxWidth str:model.stitle];
    self.contentFrame = (CGRect){{contentX,contentY},contentSize};
    
    
//    CGFloat readH = 40;
//    CGFloat readX = titleX;
//    CGFloat readY = CGRectGetMaxY(self.contentFrame)+2*homePedding;
//    CGFloat readW = 100;
//    self.dyInfoFrame = CGRectMake(readX, readY, readW, readH);
     self.originalFrame =CGRectMake(oriX, oriY, oriW, oriH);
    
    self.maxHight = CGRectGetMaxY(self.iconFrame)+oriY;
}


@end
