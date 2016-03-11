//
//  DTDiscussFrame.h
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTDiscuss;
@interface DTDiscussFrame : NSObject
@property (nonatomic ,strong)DTDiscuss *discuss;


@property (assign ,nonatomic)CGRect fromLabelFrame;
@property (assign ,nonatomic)CGRect contentLabelFrame;
@property (assign ,nonatomic)CGRect iconFrame;
@property (assign ,nonatomic)CGRect nameLabelFrame;
@property (assign ,nonatomic)CGRect timeLabelFrame;
@property (assign ,nonatomic)CGRect seeCountLabelFrame;

@property (assign ,nonatomic)CGFloat maxHight;

@end
