//
//  DTTitleCell.m
//  DuiTang
//
//  Created by Monky on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTTitleCell.h"
#import "UIKit+AFNetworking.h"


@interface DTTitleCell()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation DTTitleCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setFrame:(CGRect)frame
{
    CGRect changeFrame=CGRectMake(0, 0, frame.size.width, frame.size.height);
    [super setFrame:changeFrame];
    [UIView animateWithDuration:1 animations:^{
        [super setFrame:frame];
    } completion:nil];
}

- (void)configureModel:(Group *)model {
    
    [self.image setImageWithURL:[NSURL URLWithString:model.icon_url]];
    
    self.titleLabel.text = model.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
