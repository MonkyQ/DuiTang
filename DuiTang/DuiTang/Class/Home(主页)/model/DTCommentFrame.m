//
//  DTCommentFrame.m
//  DuiTang
//
//  Created by 苏威 on 16/3/11.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTCommentFrame.h"
#import "DTSender.h"
#import "DTComment.h"

@implementation DTCommentFrame
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
-(void)setComment:(DTComment *)comment
{
    _comment = comment;
    DTSender *sender = comment.sender;
    
    //圆角头像
    CGFloat headX = homePedding;
    CGFloat headY = homePedding;
    CGFloat headWH = 40;


    self.headImageFrame =CGRectMake(headX, headY, headWH, headWH);
    
    
    //name
    CGFloat nameX = CGRectGetMaxX(self.headImageFrame)+homePedding;
     CGFloat nameY = headY+3;
    CGSize nameSize = [self sizeWithFont:[UIFont boldSystemFontOfSize:10] maxW:150 str:sender.username];
    self.nameFrame = (CGRect){{nameX,nameY},nameSize};
    
    
    //time
    CGSize timeSize = [self sizeWithFont:[UIFont systemFontOfSize:10] maxW:mainScreenWidth str:@"7月前"];
    CGFloat timeX = mainScreenWidth-homePedding-timeSize.width;
    CGFloat timeY = nameY;
   
    self.timeLabelFrame = (CGRect){{timeX,timeY},timeSize};
    
    //内容
    CGFloat maxContentW =CGRectGetMidX(self.timeLabelFrame)-CGRectGetMaxX(self.headImageFrame)-40;
    
    CGFloat contentX = nameX;
    CGFloat contentY = CGRectGetMaxY(self.nameFrame);
    CGSize contentSize = [self sizeWithFont:titleFont maxW:maxContentW str:comment.content];
    
   

    self.contentFrame = (CGRect){{contentX,contentY},{contentSize.width+40,contentSize.height+40}};
    
    self.maxHight = CGRectGetMaxY(self.contentFrame)+2;
}
@end
