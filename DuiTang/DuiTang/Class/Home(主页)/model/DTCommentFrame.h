//
//  DTCommentFrame.h
//  DuiTang
//
//  Created by 苏威 on 16/3/11.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTComment;
@interface DTCommentFrame : NSObject
@property (nonatomic ,strong)DTComment *comment;




//计算控件尺寸
@property (assign ,nonatomic)CGRect headImageFrame;
@property (assign ,nonatomic)CGRect contentFrame;
@property (assign ,nonatomic)CGRect nameFrame;
@property (assign ,nonatomic)CGRect timeLabelFrame;
@property (assign ,nonatomic)CGRect seeCountLabelFrame;

@property (assign ,nonatomic)CGFloat maxHight;

@end
