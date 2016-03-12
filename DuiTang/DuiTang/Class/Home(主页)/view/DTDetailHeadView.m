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
//图片游览器
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

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
        imageView.userInteractionEnabled = YES;
        //给imageview添加放大图片手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [imageView addGestureRecognizer:tap];
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

- (void)tapClick:(UITapGestureRecognizer *)tap
{
    // 1.创建图片浏览器
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    
    // 2.设置图片浏览器显示的所有图片
    NSMutableArray *photos = [NSMutableArray array];
  

       DTPhoto *pic = self.modelF.detail.photo;
        
        MJPhoto *photo = [[MJPhoto alloc] init];
    
    
        // 设置图片的路径
     NSString *str = [pic.path stringByReplacingOccurrencesOfString:@"_webp" withString:@""];
        photo.url = [NSURL URLWithString:str];
        // 设置来源于哪一个UIImageView
        photo.srcImageView =(UIImageView *) tap.view;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressClick:)];
    [photo.srcImageView addGestureRecognizer:longPress];
        [photos addObject:photo];
  
    browser.photos = photos;
    
    // 3.设置默认显示的图片索引
    browser.currentPhotoIndex = 0;
    
    // 3.显示浏览器
    
    [browser show];
    UIImage *image=photo.capture;
    NSLog(@"%@=================",image);
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

}
 - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        NSLog(@"%@",error);
    }
    NSLog(@"保存图片");
    
}

-(void)longPressClick:(UILongPressGestureRecognizer *)longPress
{
    NSLog(@"longPressClicklongPressClicklongPressClicklongPressClicklongPressClick");
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
