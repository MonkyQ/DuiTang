


//
//  DTHomeTopView.m
//  DuiTang
//
//  Created by 苏威 on 16/3/11.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTHomeTopView.h"

@implementation DTHomeTopView
//拉伸图片保证图片不变形的方法
-(UIImage *)resizeImageWithImage:(UIImage *)image
{
    CGFloat x = image.size.width * 0.5; //100 * 0.5
    CGFloat y = image.size.height * 0.5;
    CGFloat w = x;
    CGFloat h = y;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(x, y, w, h)];
}
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"chat_recive_press_pic"];
    image = [self resizeImageWithImage:image];
    [image drawInRect:rect];
}


@end
