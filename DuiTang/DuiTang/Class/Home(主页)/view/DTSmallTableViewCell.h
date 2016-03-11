//
//  DTSmallTableViewCell.h
//  DuiTang
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTModelFrame.h"

@interface DTSmallTableViewCell : UITableViewCell
+(id)smallTableViewCellWithTableView:(UITableView *)tableView;
@property (nonatomic ,strong)DTModelFrame *model;
@end
