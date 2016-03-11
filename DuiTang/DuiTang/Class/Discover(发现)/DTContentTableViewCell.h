//
//  DTContentTableViewCell.h
//  DuiTang
//
//  Created by Monky on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTContentModel.h"

@interface DTContentTableViewCell : UITableViewCell

- (void)configureModel:(Content *)model;

+ (CGFloat)heightWithModel:(Content *)model;

@end
