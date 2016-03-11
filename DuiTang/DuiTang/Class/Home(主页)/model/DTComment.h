//
//  DTComment.h
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  strongright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTSender.h"
@interface DTComment : NSObject
@property (strong ,nonatomic) NSString * add_datetime_ts;
@property (strong ,nonatomic) NSString * content;
@property (strong ,nonatomic) NSString * cid;
@property (strong ,nonatomic) NSString * like_count;
@property (strong ,nonatomic) NSArray * replies;
@property (strong ,nonatomic) NSString * reply_count;
@property (strong ,nonatomic) DTSender * sender;
@property (strong ,nonatomic) NSString * type;
@end
