//
//  DTBaseFrame.h
//  DuiTang
//
//  Created by 苏威 on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTBaseFrame : NSObject

//控件frame
@property (assign ,nonatomic)CGRect iconFrame;
@property (assign ,nonatomic)CGRect titleFrame;
@property (assign ,nonatomic)CGRect contentFrame;
@property (assign ,nonatomic)CGRect dyInfoFrame;
@property (assign ,nonatomic)CGFloat maxHight;
@end
