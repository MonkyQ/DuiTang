//
//  DTDetailFrame.m
//  DuiTang
//
//  Created by 苏威 on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDetailFrame.h"
#import "DTPhoto.h"
#import "DTDetail.h"
#import "DTSender.h"
#import "DTAlbum.h"
#define minLine 3
#define specialCount 3

#define maxDetailW  250
@implementation DTDetailFrame
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

-(void)setDetail:(DTDetail *)detail
{
    _detail = detail;
    DTAlbum *album = detail.album;
    DTPhoto *photo = detail.photo;
    DTSender *sender = detail.sender;
    
    double pencent = [photo.height doubleValue]/[photo.width doubleValue];
    CGFloat iconW = mainScreenWidth-(2*homePedding);
    self.iconFrame = CGRectMake(homePedding, homePedding,  iconW , iconW*pencent);
    
 
    //CGSize conSize = [self sizeWithFont:titleFont maxW:iconW str:str];
    //相当于父控件
    //小圆角头像
     CGFloat smallIconX = homePedding;
    CGFloat smallIconY = homePedding;
    CGFloat smallIconWH = 40;
    self.smallIconFrame = CGRectMake(smallIconX, smallIconY, smallIconWH, smallIconWH);
    
    //名字
    CGFloat nameX = CGRectGetMaxX(self.smallIconFrame)+homePedding;
    CGFloat nameY = smallIconY;
    CGSize nameSize = [self sizeWithFont:titleFont maxW:maxDetailW str:sender.username];
    
    self.nameFrame = (CGRect){{nameX,nameY},nameSize};
    //时间
    
    CGFloat timeX = CGRectGetMaxX(self.nameFrame)+homePedding;
    CGFloat timeY = nameY;
    CGSize timeSize = [self sizeWithFont:otherFont maxW:maxDetailW str:detail.add_datetime_pretty];
    
    
    self.timeFrame = (CGRect){{timeX,timeY},timeSize};
    
    //小内容
    CGFloat conX = nameX;
       NSString *str = [NSString stringWithFormat:@"收集到 %@",album.name];
    CGFloat conY = CGRectGetMaxY(self.nameFrame)+homePedding;
    CGSize conSize = [self sizeWithFont:titleFont maxW:mainScreenWidth-(2*homePedding)-nameX str:str];
    self.littleContentFrame = (CGRect){{conX,conY},conSize};
    
    //右边的小图片
    CGFloat littleWH = 20;
    CGFloat littleX = mainScreenWidth-homePedding-littleWH;
    
    self.littleImageFrame = CGRectMake(littleX, 25, littleWH, littleWH);
    
    //图片的下面的父控件的
    self.contentFrame = CGRectMake(homePedding, CGRectGetMaxY(self.iconFrame)+maxLine, iconW, CGRectGetMaxY(self.littleContentFrame)+homePedding);
    
    //msg控件
    
    CGFloat msgY = CGRectGetMaxY(self.contentFrame)+maxLine;
    CGSize msgSize = [self sizeWithFont:titleFont maxW:mainScreenWidth-(2*homePedding) str:detail.msg];
    CGFloat maxH = msgSize.height;
    if (maxH <= 50) {
        msgSize.height = 50;
    }
    self.msgFrame = (CGRect){{homePedding,msgY},msgSize};
    
    
    
    
    //专辑板块
    //title的
    CGFloat specialX = 0;
    CGFloat specialY = 0;
    CGFloat specialW = iconW;
    CGFloat specialH = 50;
    
    self.specialLabelFrame =CGRectMake(specialX, specialY, specialW, specialH);
    
    //scrollView的
    
    
    
    self.specialScrollFrame = CGRectMake(0, 0, 0, 0);
    CGFloat specialSX = specialX;
    CGFloat specialSY = CGRectGetMaxY(self.specialLabelFrame)+homePedding;
    CGFloat specialSW = iconW;
    CGFloat specialSH = ( iconW-(specialCount+1)*homePedding)/specialCount+2*homePedding;
;
    
    self.specialScrollFrame = CGRectMake(specialSX, specialSY, specialSW, specialSH);
    
    
    self.specialViewFrame = CGRectMake(homePedding, CGRectGetMaxY(self.msgFrame)+homePedding, iconW, CGRectGetMaxY(self.specialScrollFrame)+homePedding);
    
    
    self.maxHeight = CGRectGetMaxY(self.specialViewFrame);
}

@end
