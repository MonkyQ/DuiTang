//
//  DTDetailModel.h
//  DuiTang
//
//  Created by Monky on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class Detai;
@protocol Detai;
@interface DTDetailModel : JSONModel
@property (nonatomic,strong)Detai *data;
@property (nonatomic,strong)NSNumber *status;
@end

@class DetaiList;
@protocol DetaiList;
@interface Detai : JSONModel
@property (nonatomic,strong)NSArray<DetaiList> *object_list;
@property (nonatomic,strong)NSNumber *more;
@property (nonatomic,strong)NSNumber *next_start;
@end

@class DetaiListPhoto;
@interface DetaiList : JSONModel
@property (nonatomic,strong)NSString *add_datetime;
@property (nonatomic,strong)NSString *add_datetime_pretty;
@property (nonatomic,strong)NSNumber *add_datetime_ts;
@property (nonatomic,strong)NSNumber *buyable;
@property (nonatomic,strong)NSNumber *favorite_count;
@property (nonatomic,strong)NSNumber *Did;
@property (nonatomic,strong)NSString *msg;
@property (nonatomic,strong)DetaiListPhoto *photo;
@property (nonatomic,strong)NSNumber *sender_id;
@property (nonatomic,strong)NSString *source_link;
@end


@interface DetaiListPhoto : JSONModel
@property (nonatomic,strong)NSString *path;
@property (nonatomic,strong)NSNumber *height;
@property (nonatomic,strong)NSNumber *width;
@end

