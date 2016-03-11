//
//  DTSmallTableViewCell.m
//  DuiTang
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTSmallTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+Extension.h"
#import "DTHomeModel.h"

@interface DTSmallTableViewCell()
@property (weak ,nonatomic)UIImageView *iconImageView;
@property (weak ,nonatomic) UILabel *readLabel;
@property (weak ,nonatomic)UILabel *contentLabel;
@property (weak ,nonatomic)UILabel *titleLabel;
@property (weak ,nonatomic) UIView *originView;
@end

@implementation DTSmallTableViewCell
+(id)smallTableViewCellWithTableView:(UITableView *)tableView
{
    NSString *className =NSStringFromClass([self class]);
    DTSmallTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:className];
    if (cell==nil) {
        cell = [[DTSmallTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        UIView *originView = [[UIView alloc]init];
        [self.contentView addSubview:originView];
        originView.backgroundColor = [UIColor whiteColor];
        self.originView = originView;
        
        UIImageView *iconImageView = [[UIImageView alloc]init];
        [self.originView addSubview:iconImageView];
        self.iconImageView =iconImageView;
    
        
        UILabel *titleLabel = [[UILabel alloc]init];
        [self.originView addSubview:titleLabel];
        self.titleLabel= titleLabel;
               self.titleLabel.font = titleFont;
        titleLabel.numberOfLines = 0;
        titleLabel.textColor = [UIColor blackColor];
        
        
        UILabel *contentLabel = [[UILabel alloc]init];
        [self.originView addSubview:contentLabel];
        self.contentLabel= contentLabel;
        contentLabel.numberOfLines = 0;

        contentLabel.font = otherFont;
        
        UILabel *readLabel = [[UILabel alloc]init];
        [self.originView addSubview:readLabel];
        self.readLabel = readLabel;
              readLabel.font = otherFont;
        readLabel.numberOfLines = 0;
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}
-(void)setModel:(DTModelFrame *)model
{
    _model = model;
    DTHomeModel *hModel=model.model;
   
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:hModel.image_url]];
    self.iconImageView.frame = model.iconFrame;
    
    self.titleLabel.text = hModel.des;
   // NSLog(@"%@",hModel.des);
    self.titleLabel.frame = model.titleFrame;
   
    self.contentLabel.text = hModel.stitle;
    self.contentLabel.frame = model.contentFrame;
    self.contentLabel.textColor = DTGlobalBg;
    
     self.readLabel.text = hModel.dynamic_info;
    self.readLabel.frame = model .dyInfoFrame;
    self.originView.frame = model.originalFrame;
    
   
}


-(void)setFrame:(CGRect)frame
{
    CGRect rect = frame;
    frame.origin.x-= 30;
    
    [super setFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    [UIView animateWithDuration:1.0 animations:^{
        [super setFrame:rect];
    }completion:^(BOOL finished) {
        self.backgroundColor = [UIColor clearColor];
    }];
}
@end
