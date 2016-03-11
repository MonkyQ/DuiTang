//
//  DTDetailContentView.m
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDetailContentView.h"

#import "DTDetailFrame.h"
#import "DTDetail.h"
#import "DTSender.h"
#import "DTAlbum.h"

#import "UIImageView+webcache.h"

@interface DTDetailContentView ()
@property (nonatomic ,weak) UIImageView *iconImage;
@property (nonatomic ,weak) UILabel *nameLabel;
@property (nonatomic ,weak) UILabel *timeLabel;
@property (nonatomic ,weak) UILabel *littleContent;

@property (nonatomic ,weak) UIImageView *littleImage;


@end

@implementation DTDetailContentView

-(id)init
{
    if (self = [super init]) {
        
        //初始化子控件
        
        UIImageView *iconImage = [[UIImageView alloc ]init];
        [self addSubview:iconImage];
        self.iconImage = iconImage;
        self.iconImage.layer.cornerRadius  = 20;
        self.iconImage.clipsToBounds = YES;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        self.nameLabel.textColor = [UIColor blueColor];
        nameLabel.numberOfLines = 0;
        nameLabel.font = titleFont;
        
        UILabel *timeLabel = [[UILabel alloc]init];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        timeLabel.numberOfLines = 0;
        timeLabel.font = otherFont;
        
        UILabel *littleContent = [[UILabel alloc]init];
        [self addSubview:littleContent];
        self.littleContent = littleContent;
        littleContent.numberOfLines = 0;
        littleContent.font = titleFont;
        
//        UIImageView *littleImage = [[UIImageView alloc]init];
//        [self addSubview:littleImage];
//        littleImage.image = [UIImage imageNamed:@"ToolViewInputTextHL"];
//        self.littleImage = littleImage;
        
    }
    return self;
}


-(void)setModel:(DTDetailFrame *)model
{
    _model = model;
    DTDetail *detail = model.detail;
    DTSender *sender = detail.sender;
    DTAlbum *album = detail.album;
    
    self.iconImage.frame = model.smallIconFrame;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:sender.avatar]];
    
    self.nameLabel.frame = model.nameFrame;
    self.nameLabel .text = sender.username;
    
    self.timeLabel.frame = model.timeFrame;
    self.timeLabel.text = detail.add_datetime_pretty;
    
    
    NSString *str = [NSString stringWithFormat:@"收集到 %@",album.name];
    self.littleContent .frame = model.littleContentFrame;
    self.littleContent.text = str;
    
   
    
    
    
}
@end
