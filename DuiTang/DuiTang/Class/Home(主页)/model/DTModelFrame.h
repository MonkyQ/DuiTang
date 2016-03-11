//
//  DTModelFrame.h
//  DuiTang
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTBaseFrame.h"
@class DTHomeModel;
@interface DTModelFrame : DTBaseFrame

@property (nonatomic ,strong)DTHomeModel *model;
@property (nonatomic ,assign)CGRect originalFrame;

@end
