//
//  DTReadCell.h
//  DuiTang
//
//  Created by Dylan on 3/7/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DTReadModel.h"

@interface DTReadCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *readCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;

+(DTReadCell *)cellWithTableView:(UITableView *)tableView;

-(void)setmodel:(DTReadModel *)mod;
@end
