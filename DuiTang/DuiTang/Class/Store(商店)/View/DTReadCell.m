//
//  DTReadCell.m
//  DuiTang
//
//  Created by Dylan on 3/7/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import "DTReadCell.h"
@interface DTReadModel()


@end;

@implementation DTReadCell

- (void)awakeFromNib {
    // Initialization code
}
+(DTReadCell *)cellWithTableView:(UITableView *)tableView
{
    NSString * identifity=NSStringFromClass([self class]);
    UINib * nib=[UINib nibWithNibName:identifity bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifity];
    return [tableView dequeueReusableCellWithIdentifier:identifity];
}

-(void)setmodel:(DTReadModel *)mod
{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:mod.cover.photo_path]];
    self.titleLabel.text=mod.title;
    self.detailLabel.text=mod.cover.cover_desc;
    self.detailLabel.numberOfLines=0;
    self.readCountLabel.text=[NSString stringWithFormat:@"%@人阅读",mod.visit_count];
    self.commentCountLabel.text=[NSString stringWithFormat:@"%@人评论",mod.comment_count];
}

@end
