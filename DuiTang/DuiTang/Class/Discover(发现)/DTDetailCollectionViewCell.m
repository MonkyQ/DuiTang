//
//  DTDetailCollectionViewCell.m
//  DuiTang
//
//  Created by Monky on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDetailCollectionViewCell.h"
#import "UIKit+AFNetworking.h"
#import "DTDetailModel.h"

@interface DTDetailCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pic1;
@property (weak, nonatomic) IBOutlet UIImageView *pic2;
@property (weak, nonatomic) IBOutlet UIImageView *pic3;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;

@end

//http://cdn.duitang.com/uploads/item/201107/20/20110720192150_wsB2c.jpg_webp
@implementation DTDetailCollectionViewCell



- (void)configureModel:(DetaiList *)model {
    DetaiListPhoto *photo = model.photo;
    NSLog(@"%@",photo.path);
    NSString *str =photo.path;
    NSString *path = [str stringByReplacingOccurrencesOfString:@"_webp" withString:@""];
    [self.photoView setImageWithURL:[NSURL URLWithString:path]];
    
    self.msgLabel.text = model.msg;
    self.msgLabel.font = [UIFont systemFontOfSize:12];
    self.msgLabel.numberOfLines = 3;
    [self.msgLabel sizeToFit];
    
    self.lab2.text = model.buyable.stringValue;
    self.lab3.text = model.favorite_count.stringValue;
}



- (void)awakeFromNib {
    // Initialization code
}

@end
