//
//  DTBigModelFrame.h
//  DuiTang
//
//  Created by 苏威 on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTBaseFrame.h"
#import "DTBigModel.h"
@interface DTBigModelFrame : DTBaseFrame
@property (nonatomic ,assign)CGRect originalFrame;
@property (nonatomic ,strong)DTBigModel *model;


@end
