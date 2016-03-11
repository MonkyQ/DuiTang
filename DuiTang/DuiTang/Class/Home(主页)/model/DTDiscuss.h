//
//  DTDiscuss.h
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  strongright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTSender.h"
#import "DTClub.h"

@interface DTDiscuss : NSObject
@property (strong ,nonatomic) NSString * active_time;
@property (strong ,nonatomic) NSString * add_datetime_ts;
@property (strong ,nonatomic) NSString * category;
@property (strong ,nonatomic) DTClub * club;
@property (strong ,nonatomic) NSString * comment_count;
@property (strong ,nonatomic) NSString * content;
@property (strong ,nonatomic) NSString * cid;
@property (strong ,nonatomic) NSArray * photos;
@property (strong ,nonatomic) DTSender * sender;
@property (strong ,nonatomic) NSString * share_links;
@property (strong ,nonatomic) NSString * visit_count;


@end
