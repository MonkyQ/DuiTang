//
//  DTCommenView.m
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTCommenView.h"
#import "DTWaterModel.h"

@implementation DTCommenView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    if ([[UIDevice currentDevice].systemVersion doubleValue]>= 7.0) { // 处理iOS7的情况
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}
- (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
//blog_list_icon_good  blog_list_icon_star
- (UIButton *)setupBtnWithIcon:(NSString *)icon title:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] init];
  
   UIImage *image = [self resizedImage:icon];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:8];
    
    // 设置间距
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [self addSubview:btn];
    
    return btn;
}


-(void)awakeFromNib
{
    [self setupBtnWithIcon:@"blog_list_icon_comments" title:@"0"];
    [self setupBtnWithIcon:@"blog_list_icon_good" title:@"0"];
    [self setupBtnWithIcon:@"blog_list_icon_star" title:self.model.favorite_count];

}
-(void)setModel:(DTWaterModel *)model{
    _model = model;
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    // 设置按钮的frame
    int btnCount = self.subviews.count;
    CGFloat margin = 3;
    CGFloat btnW = (self.width - (btnCount + 1) * margin) / btnCount;
    CGFloat btnY = 5;
    CGFloat btnH = self.height - 2 * btnY;
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = self.subviews[i];
        btn.width = btnW;
        btn.height = btnH;
        btn.y = btnY;
        btn.x = margin + i * (btnW + margin);
    }

    
}
@end
