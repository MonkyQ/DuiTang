//
//  DTWaterFrame.h
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTWaterModel;
@interface DTWaterFrame : NSObject
@property (nonatomic ,strong)DTWaterModel *model;

@property (nonatomic ,assign)CGRect iconFrame;
@property (nonatomic ,assign)CGRect contentFrame;
@property (nonatomic ,assign)CGRect commentFrame;
@property (nonatomic ,assign)CGFloat maxHight;
@end
