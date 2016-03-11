//
//  DTWaterModel.h
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  strongright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTPhoto.h"

@interface DTWaterModel : NSObject
@property (nonatomic ,strong)NSString *add_datetime;
@property (strong ,nonatomic) NSString * add_datetime_pretty;
@property (strong ,nonatomic) NSString * add_datetime_ts;
@property (strong ,nonatomic) NSString * buyable;
@property (strong ,nonatomic) NSString * extra_type;
@property (strong ,nonatomic) NSString * favorite_count;
@property (strong ,nonatomic) NSString * icon_url;
@property (strong ,nonatomic) NSString * cid;
@property (strong ,nonatomic) NSString * msg;
@property (nonatomic ,strong) DTPhoto *photo;
@property (copy ,nonatomic) NSString * sender_id;
@property (copy ,nonatomic) NSString * source_link;
@end
