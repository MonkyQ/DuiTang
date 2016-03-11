//
//  DTModelFrame.m
//  DuiTang
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTModelFrame.h"
#import "DTHomeModel.h"

#define marginLeft 5

@implementation DTModelFrame

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


//模型赋值
-(void)setModel:(DTHomeModel *)model
{
    _model = model;
    
    CGFloat oriX = marginLeft;
    CGFloat oriY = homePedding;
    CGFloat oriW = mainScreenWidth-(2*marginLeft);
    CGFloat oriH = 0;

    
    CGFloat imageW = 80;
    CGFloat imageH = 80;
//    if ([model.style isEqualToString:@"large"]) {
//        imageW = 350;
//        imageH = 200;
//        
//    }
//    
        CGFloat imageX = 0;
        CGFloat imageY = 0;
    
        self.iconFrame= CGRectMake(imageX, imageY, imageW, imageH);
    
    
    
        CGFloat titleX = homePedding+CGRectGetMaxX(self.iconFrame);
        CGFloat titleY = imageY;
    CGSize titleSize = [self sizeWithFont:titleFont maxW:oriW-imageW str:model.des];
    self.titleFrame = (CGRect){{titleX,titleY},titleSize};
    
    
        CGFloat contentX = titleX;
    CGFloat contentY = homePedding+CGRectGetMaxY(self.titleFrame);
       CGSize contentSize = [self sizeWithFont:otherFont maxW:oriW-imageW str:model.stitle];
    self.contentFrame = (CGRect){{contentX,contentY},contentSize};
    
    
    CGSize readSize = [self sizeWithFont:otherFont maxW:oriW-imageW str:model.dynamic_info];
    CGFloat readX = titleX;
        CGFloat readY = imageW - readSize.height;
    
    
    self.dyInfoFrame = (CGRect){{readX,readY},readSize};
    
    oriH = CGRectGetMaxY(self.dyInfoFrame);
    self.originalFrame =CGRectMake(oriX, oriY, oriW, oriH);
    
    self.maxHight = CGRectGetMaxY(self.dyInfoFrame)+oriX;
    }

  

@end
