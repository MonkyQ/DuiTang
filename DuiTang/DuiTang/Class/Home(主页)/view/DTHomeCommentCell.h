//
//  DTHomeCommentCell.h
//  DuiTang
//
//  Created by 苏威 on 16/3/11.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTCommentFrame;
@interface DTHomeCommentCell : UITableViewCell
@property (nonatomic ,strong)DTCommentFrame *commentF;
+(id)homeCommentCellWithTableView:(UITableView *)tableView;
@end
