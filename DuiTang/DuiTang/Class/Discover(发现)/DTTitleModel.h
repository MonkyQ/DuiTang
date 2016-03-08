//
//  DTTitleModel.h
//  DuiTang
//
//  Created by Monky on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class Data;
@protocol Data;
@interface DTTitleModel : JSONModel
@property (nonatomic,strong)NSArray<Data> *data;
@property (nonatomic,strong)NSNumber *status;

@end
@class Group;
@protocol Group;
@interface Data : JSONModel
@property (nonatomic,strong)NSString<Optional> *content_type;
@property (nonatomic,strong)NSString<Optional> *group_id;
@property (nonatomic,strong)NSString<Optional> *group_name;
@property (nonatomic,strong)NSArray<Group> *group_items;
@end


@interface Group : JSONModel
@property (nonatomic,strong)NSString<Optional> *icon_url;
@property (nonatomic,strong)NSString<Optional> *name;
@property (nonatomic,strong)NSString<Optional> *target;
@end