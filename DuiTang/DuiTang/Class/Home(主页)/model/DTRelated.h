//
//  DTRelated.h
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTUser.h"

@interface DTRelated : NSObject
@property (nonatomic ,strong)NSString *category;
@property (nonatomic ,strong)NSArray *covers;
@property (nonatomic ,strong)NSString *name;
@property (nonatomic ,strong)NSString *count;
@property (nonatomic ,strong)DTUser *user;
@property (nonatomic ,strong)NSString *cid;

@end
