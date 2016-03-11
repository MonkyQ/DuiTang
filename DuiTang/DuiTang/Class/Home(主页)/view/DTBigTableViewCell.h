//
//  DTBigTableViewCell.h
//  DuiTang




//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTBigModelFrame.h"

@interface DTBigTableViewCell : UITableViewCell
+(id)bigTableViewCellWithTableView:(UITableView *)tableView;
@property (nonatomic ,strong)DTBigModelFrame *model;
@end
