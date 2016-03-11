//
//  DTContentView.m
//  DuiTang
//
//  Created by Monky on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTContentView.h"
#import "UIKit+AFNetworking.h"

@interface DTContentView ()

@property (nonatomic,strong) UIImageView *PhotoView;

@property (nonatomic,strong) UILabel *MsgLabel;

@property (nonatomic,strong) UILabel *timeLabel;
@end


@implementation DTContentView

- (void)configureModel:(Content *)model
{
    if (model==nil) {
        return;
    }
    ContentPhoto *photo =model.photo;
    NSLog(@"______________%@",photo.width);
    NSString *str =photo.path;
    NSString *path = [str stringByReplacingOccurrencesOfString:@"_webp" withString:@""];
    UIImageView *PhotoView = [[UIImageView alloc]init];
    [PhotoView setImageWithURL:[NSURL URLWithString:path]];
    self.PhotoView = PhotoView;
    //图片高度
    CGFloat width = [UIScreen mainScreen].bounds.size.width-24;
    CGFloat w = photo.width.doubleValue;
    CGFloat h = photo.height.doubleValue;
    CGFloat height = width * h / w;
    PhotoView.frame = CGRectMake(0, 0, width, height);
    [self addSubview:PhotoView];
        NSLog(@"-----%f------%f",width,height);
    
    
    
    //描述
    UILabel *MsgLabel = [[UILabel alloc]init];
    self.MsgLabel = MsgLabel;
    MsgLabel.text = model.msg;
    [self addSubview:MsgLabel];
    MsgLabel.numberOfLines = 0;
    MsgLabel.font = [UIFont systemFontOfSize:13];
    NSDictionary *dict = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]};
    CGFloat titleH = [model.msg boundingRectWithSize:CGSizeMake(width-16, CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
    MsgLabel.frame =CGRectMake(8, height+8, width-16, titleH);
    
    //头像
    ContentSender *sender = model.sender;
    NSString *str1 =sender.avatar;
    NSString *path1 = [str1 stringByReplacingOccurrencesOfString:@"_webp" withString:@""];
    UIImageView *headerView =[[UIImageView alloc]init];
    [self addSubview:headerView];
    [headerView setImageWithURL:[NSURL URLWithString:path1]];
    headerView.layer.cornerRadius = 20;
    headerView.layer.masksToBounds= YES;
    headerView.frame = CGRectMake(10, height+8+titleH+20, 40, 40);
    
    
    
    //时间
    UILabel *timeLabel = [[UILabel alloc]init];
    self.timeLabel = timeLabel;
    timeLabel.text = model.add_datetime;
    timeLabel.font = [UIFont systemFontOfSize:13];
    timeLabel.textColor = [UIColor colorWithWhite:0.600 alpha:1.000];
    [self addSubview:timeLabel];
    CGFloat X = width - 80;
    CGFloat Y = height+8+titleH;
    CGFloat W = 80;
    CGFloat H = 50;
    
    timeLabel.frame = CGRectMake(X, Y, W, H);
    self.Height = height + 8 +titleH + 8 + 60;
    self.Width = width;
  
    //用户名
    UILabel *nameLabel = [[UILabel alloc]init];
    [self addSubview:nameLabel];
    nameLabel.text =sender.username;
   // nameLabel.backgroundColor = [UIColor yellowColor];
    nameLabel.font= [UIFont systemFontOfSize:13];
    nameLabel.textColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000];
    nameLabel.frame = CGRectMake(56, Y+15, 150, 20);
    
    ContentAlbum *album =model.album;
    UILabel *albumLabel =[[UILabel alloc]init];
    [self addSubview:albumLabel];
    albumLabel.text =[NSString stringWithFormat:@"收集到 %@",album.name];
    albumLabel.font = [UIFont systemFontOfSize:13];
    //albumLabel.backgroundColor = [UIColor greenColor];
    albumLabel.numberOfLines = 0;
    NSDictionary *dict1 = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]};
    CGFloat albumLabelH = [album.name boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:dict1 context:nil].size.height;
    albumLabel.frame = CGRectMake(56, Y+39, 200, albumLabelH);
    
}



//- (void)setFrame:(CGRect)frame
//{
//    frame.origin.x = 12;
//    frame.size.width -= 2 * 12;
//    frame.size.height -= 12;
//    frame.origin.y += 12;
//    
//    [super setFrame:frame];
//}

@end
