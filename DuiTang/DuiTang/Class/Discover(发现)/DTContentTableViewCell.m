//
//  DTContentTableViewCell.m
//  DuiTang
//
//  Created by Monky on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTContentTableViewCell.h"

#import "UIKit+AFNetworking.h"


@interface DTContentTableViewCell ()
{
    CGFloat _Height;
}
@property (weak, nonatomic) IBOutlet UIImageView *PhotoView;

@property (weak, nonatomic) IBOutlet UILabel *MsgLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
@implementation DTContentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 12;
    frame.size.width -= 2 * 12;
    frame.size.height -= 12;
    frame.origin.y += 12;

    [super setFrame:frame];
}

+ (CGFloat)heightWithModel:(Content *)model
{
    

    ContentPhoto *photo =model.photo;
    CGFloat width = [UIScreen mainScreen].bounds.size.width-24;
    CGFloat w = photo.width.doubleValue;
    CGFloat h = photo.height.doubleValue;
    CGFloat height = width * h / w;
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]};
    CGFloat titleH = [model.msg boundingRectWithSize:CGSizeMake(width-16, CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
    
    return  height + 8 +titleH + 8 + 50;

}

- (void)configureModel:(Content *)model
{
    if (model==nil) {
        return;
    }
    ContentPhoto *photo =model.photo;
    NSLog(@"______________%@",photo.width);
    NSString *str =photo.path;
    NSString *path = [str stringByReplacingOccurrencesOfString:@"_webp" withString:@""];
    [self.PhotoView setImageWithURL:[NSURL URLWithString:path]];
    CGFloat width = [UIScreen mainScreen].bounds.size.width-24;
    CGFloat w = photo.width.doubleValue;
    CGFloat h = photo.height.doubleValue;
    CGFloat height = width * h / w;
    self.PhotoView.frame = CGRectMake(0, 0, width, height);
    
    self.MsgLabel.text = model.msg;
    self.MsgLabel.numberOfLines = 0;
    self.MsgLabel.font = [UIFont systemFontOfSize:13];
    NSDictionary *dict = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]};
    CGFloat titleH = [model.msg boundingRectWithSize:CGSizeMake(width-16, CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
    self.MsgLabel.frame =CGRectMake(8, height+8, width-16, titleH);
    
    self.timeLabel.text = model.add_datetime;
    
    CGFloat X = width - 100;
    CGFloat Y = width-16+titleH +8;
    CGFloat W = 100;
    CGFloat H = 50;
    
    self.timeLabel.frame = CGRectMake(X, Y, W, H);
    _Height = height + 8 +titleH + 8 + 50;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
