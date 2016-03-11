//
//  DTDiscussFrame.m
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDiscussFrame.h"
#import "DTDiscuss.h"
#import "DTSender.h"
@implementation DTDiscussFrame
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
-(void)setDiscuss:(DTDiscuss *)discuss
{
    _discuss = discuss;
    DTSender *sender = discuss.sender;
    
    
    //来自frame
    CGFloat fromX = homePedding;
    CGFloat fromY = 0;
    CGFloat fromW = mainScreenWidth-(2*homePedding);
    CGFloat fromH = 30;
    self.fromLabelFrame = CGRectMake(fromX, fromY, fromW, fromH);
    
    //内容
    CGFloat contentX = fromX;
    CGFloat contentY = CGRectGetMaxY(self.fromLabelFrame)+homePedding;
    CGSize contentSize = [self sizeWithFont:[UIFont boldSystemFontOfSize:15] maxW:fromW-homePedding str:discuss.content];
    self.contentLabelFrame = (CGRect){{contentX,contentY},contentSize};
    
    //图片
     CGFloat iconX = contentX;
     CGFloat iconY = CGRectGetMaxY(self.contentLabelFrame)+homePedding;
     CGFloat iconW = 100;
     CGFloat iconH = 100;
    NSArray *arr = discuss.photos;
    if (arr.count<=0) {
        iconH = 0;
        iconW = 0;
    }
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    //名字
    CGFloat nameX = iconX;
    CGFloat nameY = CGRectGetMaxY(self.iconFrame)+homePedding;
    CGSize nameSize = [self sizeWithFont:[UIFont systemFontOfSize:14] maxW:fromW str:sender.username];
    
    self.nameLabelFrame =  (CGRect){{nameX,nameY},nameSize};
    
    //时间
    double from = [discuss.active_time doubleValue];
    double to = [discuss.add_datetime_ts doubleValue];
    int day = (int)(from - to)/60/60/24;
    NSString *str =nil;
    if (day<=1) {
        str = @"今天";
    }else {
        str = [NSString stringWithFormat:@"%d天前",day];
    }
    
    CGFloat timeX = CGRectGetMaxX(self.nameLabelFrame)+homePedding;
    CGFloat timeY = nameY+2;
    CGSize timeSize = [self sizeWithFont:[UIFont systemFontOfSize:10] maxW:fromW str:str];
    self.timeLabelFrame = (CGRect){{timeX,timeY},timeSize};
    
    NSString *countStr = [NSString stringWithFormat:@"游览 %@次",discuss.visit_count];
    
    CGSize seeSize = [self sizeWithFont:[UIFont systemFontOfSize:14] maxW:fromW str:countStr];
    CGFloat seeX = mainScreenWidth-homePedding - seeSize.width-homePedding ;
    CGFloat seeY = timeY;
    self.seeCountLabelFrame = (CGRect){{seeX,seeY},seeSize};
    
    self.maxHight = CGRectGetMaxY(self.seeCountLabelFrame);

}
@end
