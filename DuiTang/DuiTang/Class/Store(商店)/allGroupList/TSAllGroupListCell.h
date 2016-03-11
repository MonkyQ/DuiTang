//
//  TSAllGroupListCell.h
//  TSGroupDemo
//
//  Created by Dylan on 3/9/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSAllGroupListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *describeLabel;
@property (weak, nonatomic) IBOutlet UIButton *addGroupBtn;

@property (nonatomic,strong)void (^TSAllGroupListCellSelectBlock)(TSAllGroupListCell * cell);


+(TSAllGroupListCell *)cellWithTableView:(UITableView *)tableView;

-(void)configWithEmgroup:(EMGroup *)group;
@end
