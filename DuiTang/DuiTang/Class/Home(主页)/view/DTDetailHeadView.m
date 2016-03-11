//
//  DTDetailHeadView.m
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDetailHeadView.h"
#import "DTDetail.h"
#import "DTAlbum.h"
#import "DTPhoto.h"

#import "DTDetailContentView.h"

#import "UIImageView+webcache.h"

#import "DTDetailFrame.h"
@interface DTDetailHeadView ()
@property (nonatomic , weak) UIImageView *imageView;
@property (nonatomic , weak) DTDetailContentView *contentView;
@property (nonatomic , weak) UILabel *contentLabel;
@property (nonatomic , weak)UILabel *defineLabel;

@end

@implementation DTDetailHeadView

-(id)init
{
    if (self = [super init]) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        DTDetailContentView *contentView = [[DTDetailContentView alloc]init];
        [self addSubview:contentView];
        contentView.backgroundColor = [UIColor grayColor];
        self.contentView = contentView;
        
        UILabel *contentLabel = [[UILabel alloc] init];
        [self addSubview:contentLabel];
   
        contentLabel.numberOfLines = 0;
        contentLabel.font = titleFont;
        self.contentLabel = contentLabel;
        
        UILabel *defineLabel = [[UILabel alloc]init];
        [self addSubview:defineLabel];
        self.defineLabel = defineLabel;
        
        self.backgroundColor = DTGlobalBg;
    }
    return self;
}

-(void)setModelF:(DTDetailFrame *)modelF
{
    _modelF = modelF;
    DTDetail *detail = modelF.detail;
    
    DTPhoto *photo = detail.photo;
    self.imageView.frame = modelF.iconFrame;
   // NSLog(@"%@",photo.path);
    NSString *str = [photo.path stringByReplacingOccurrencesOfString:@"_webp" withString:@""];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:str]];
    
    self.contentView.model = modelF;
    self.contentView.frame = modelF.contentFrame;
    
    
    self.contentLabel.frame = modelF.msgFrame;
    self.contentLabel.text = detail.msg;
    self.contentLabel.backgroundColor = DTGlobalBg;
    
    
    self.x = 0;
    self.y = 0;
    self.height = CGRectGetMaxY(self.contentLabel.frame)+homePedding;
    self.width = mainScreenWidth;
}
@end
