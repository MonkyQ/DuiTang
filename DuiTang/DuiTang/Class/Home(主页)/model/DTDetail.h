//
//  DTDetail.h
//  DuiTang
//
//  Created by 苏威 on 16/3/9.
//  strongright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTPhoto.h"
#import "DTAlbum.h"
#import "DTSender.h"
@interface DTDetail : NSObject
@property (strong ,nonatomic) NSString * add_datetime;
@property (strong ,nonatomic) NSString * add_datetime_pretty;
@property (strong ,nonatomic) NSString * add_datetime_ts;
@property (strong ,nonatomic) DTAlbum * album;
@property (strong ,nonatomic) NSString * buyable;
@property (strong ,nonatomic) NSString * event_count;
@property (strong ,nonatomic) NSString * extra_type;
@property (strong ,nonatomic) NSString * favorite_count;
@property (strong ,nonatomic) NSString * has_favorited;
@property (strong ,nonatomic) NSString * icon_url;
@property (strong ,nonatomic) NSString * cid;
@property (strong ,nonatomic) NSString * is_root;
@property (strong ,nonatomic) NSString * like_count;
@property (strong ,nonatomic) NSString * like_id;
@property (strong ,nonatomic) NSString * msg;
@property (strong ,nonatomic) NSString * next_id;
@property (strong ,nonatomic) DTPhoto * photo;
@property (strong ,nonatomic) NSString * prev_id;
@property (strong ,nonatomic) NSString * reply_count;
@property (strong ,nonatomic) DTSender * sender;
@property (strong ,nonatomic) NSString * sender_id;


@property (nonatomic ,strong)NSArray *related_albums;



@end
