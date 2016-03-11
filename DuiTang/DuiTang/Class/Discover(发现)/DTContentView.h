//
//  DTContentView.h
//  DuiTang
//
//  Created by Monky on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTContentModel.h"


@interface DTContentView : UIView
@property (nonatomic,assign)CGFloat Height;
@property (nonatomic,assign)CGFloat Width;
- (void)configureModel:(Content *)model;
//+ (CGFloat)heightWithModel:(Content *)model;
@end
