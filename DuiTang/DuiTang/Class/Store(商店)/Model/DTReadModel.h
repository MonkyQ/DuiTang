//
//  DTReadModel.h
//  DuiTang
//
//  Created by Dylan on 3/7/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@class RootData;
@interface Root : JSONModel
@property (nonatomic,strong)RootData * data;
@property (nonatomic,strong)NSNumber * status;
@end

@class DTReadModel;
@protocol DTReadModel;
@interface RootData : JSONModel
@property (nonatomic,strong)NSNumber * more;
@property (nonatomic,strong)NSNumber * next_start;
@property (nonatomic,strong)NSArray<DTReadModel> * object_list;
@end


@class DTReadCoverModel;
@interface DTReadModel : JSONModel
@property (nonatomic,strong)NSNumber * active_time;
@property (nonatomic,strong)NSNumber * add_datetime_ts;
@property (nonatomic,strong)NSString * category;

@property (nonatomic,strong)NSDictionary * club;
@property (nonatomic,strong)NSNumber * comment_count;//评论数
@property (nonatomic,strong)NSString * content;
//第一个model
@property (nonatomic,strong)DTReadCoverModel * cover;
@property (nonatomic,strong)NSString * icon_url;//阅读数图片
@property (nonatomic,strong)NSNumber * ID;

@property (nonatomic,strong)NSDictionary * photos;
@property (nonatomic,strong)NSDictionary * sender;
@property (nonatomic,strong)NSString * title;//标题
@property (nonatomic,strong)NSNumber * visit_count;//阅读数
@end


@interface DTReadCoverModel : JSONModel
@property (nonatomic,strong)NSString * cover_desc;//介绍
@property (nonatomic,strong)NSNumber * ID;
@property (nonatomic,strong)NSString * photo_path;
@end;