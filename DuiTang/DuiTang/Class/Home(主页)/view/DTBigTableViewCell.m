//
//  DTBigTableViewCell.m
//  DuiTang
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTBigTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface DTBigTableViewCell ()

@property (weak ,nonatomic)UIImageView *iconImageView;
@property (weak ,nonatomic) UILabel *readLabel;
@property (weak ,nonatomic)UILabel *contentLabel;
@property (weak ,nonatomic)UILabel *titleLabel;
@property (weak ,nonatomic) UIView *originView;
@end
@implementation DTBigTableViewCell



+(id)bigTableViewCellWithTableView:(UITableView *)tableView;
{
    NSString *className =NSStringFromClass([self class]);
    DTBigTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:className];
    if (cell==nil) {
        cell = [[DTBigTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
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
        
        
        
        UILabel *contentLabel = [[UILabel alloc]init];
        [self.originView addSubview:contentLabel];
        self.contentLabel= contentLabel;
        contentLabel.textColor = [UIColor whiteColor];
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
-(void)setModel:(DTBigModelFrame *)model
{
    _model = model;
    DTBigModel *hModel=model.model;
    //NSLog(@"%@",hModel.image_url);
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:hModel.image_url]];
    self.iconImageView.frame = model.iconFrame;
    
    self.titleLabel.text = hModel.des;
    // NSLog(@"%@",hModel.des);
    self.titleLabel.frame = model.titleFrame;
    self.titleLabel.textColor = [UIColor whiteColor];
    
    self.contentLabel.text = hModel.stitle;
    self.contentLabel.frame = model.contentFrame;
    self.contentLabel.textColor = [UIColor whiteColor];

    self.originView.frame = model.originalFrame;
    
    self.readLabel.text = hModel.dynamic_info;
    self.readLabel.frame = model .dyInfoFrame;
}


@end
