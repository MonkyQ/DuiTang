//
//  TSAllGroupListCell.m
//  TSGroupDemo
//
//  Created by Dylan on 3/9/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import "TSAllGroupListCell.h"
#import "EMGroup.h"
@implementation TSAllGroupListCell

+(TSAllGroupListCell *)cellWithTableView:(UITableView *)tableView
{
    NSString * identifity=NSStringFromClass([self class]);
    UINib * nib=[UINib nibWithNibName:identifity bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifity];
    return [tableView dequeueReusableCellWithIdentifier:identifity];
}
-(void)configWithEmgroup:(EMGroup *)group
{
    NSString * str=[NSString stringWithFormat:@"%@(当前%ld人)",group.subject,group.occupantsCount];
    self.titleLabel.font=[UIFont systemFontOfSize:15];
    self.titleLabel.text=str;
    
    NSString * str2=[NSString stringWithFormat:@"群简介：%@",group.description];
    self.describeLabel.font=[UIFont systemFontOfSize:13];
    self.describeLabel.textColor=[UIColor grayColor];
    self.describeLabel.text=str2;
}
- (IBAction)addGroupBtnAction:(UIButton *)sender
{
    sender.userInteractionEnabled=NO;
    sender.selected=YES;
    self.TSAllGroupListCellSelectBlock(self);
}
@end
