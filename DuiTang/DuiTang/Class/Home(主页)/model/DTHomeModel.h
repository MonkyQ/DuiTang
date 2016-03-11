//
//  DTHomeModel.h
//  DuiTang
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DTHomeModel : NSObject
@property (nonatomic ,copy)NSString *content_type;
@property (nonatomic ,copy)NSString *des;
@property (nonatomic ,copy)NSString *disabled_at;
@property (nonatomic ,copy)NSString *disabled_at_str;
@property (nonatomic ,copy)NSString *dynamic_info;
@property (nonatomic ,copy)NSString *enabled_at;
@property (nonatomic ,copy)NSString *enabled_at_str;
@property (nonatomic ,copy)NSString *icon_url;
@property (nonatomic ,copy)NSString *image_url;
@property (nonatomic ,copy)NSString *stitle;
@property (nonatomic ,copy)NSString *style;
@property (nonatomic ,copy)NSString *tag;
@property (nonatomic ,copy)NSString *tag_title;
@property (nonatomic ,copy)NSString *target;
@end
