//
//  DTWebModel.h
//  DuiTang
//
//  Created by Dylan on 3/7/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@class DTWebData;
@interface DTWebModel : JSONModel
@property (nonatomic,strong)DTWebData * data;
@property (nonatomic,strong)NSNumber * status;
@end

@interface DTWebData : JSONModel
@property (nonatomic,strong)NSNumber * active_time;
@property (nonatomic,strong)NSNumber * add_datetime_ts;
@property (nonatomic,strong)NSString * article_content;//htmlstring
@property (nonatomic,strong)NSString * category;
@property (nonatomic,strong)NSDictionary * club;
@property (nonatomic,strong)NSNumber * comment_count;
@property (nonatomic,strong)NSString * content;
@property (nonatomic,strong)NSDictionary * cover;
@property (nonatomic,strong)NSNumber * ID;
@property (nonatomic,strong)NSArray * photos;
@property (nonatomic,strong)NSDictionary * sender;
@property (nonatomic,strong)NSDictionary * share_links;
@property (nonatomic,strong)NSString * title;
@property (nonatomic,strong)NSNumber * visit_count;
@end