//
//  DTContentModel.h
//  DuiTang
//
//  Created by Monky on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class Content;
@interface DTContentModel : JSONModel
@property (nonatomic,strong)Content *data;
@property (nonatomic,strong)NSNumber *status;
@end


@class ContentPhoto;
@class ContentSender;
@class ContentAlbum;
@class Contentrelated;
@protocol Contentrelated;
@interface Content : JSONModel
@property (nonatomic,strong)NSString *add_datetime;
@property (nonatomic,strong)NSString *add_datetime_pretty;
@property (nonatomic,strong)NSNumber *add_datetime_ts;
@property (nonatomic,strong)ContentAlbum *album;
@property (nonatomic,strong)NSNumber *buyable;
@property (nonatomic,strong)NSNumber *event_count;
@property (nonatomic,strong)NSString *extra_type;
@property (nonatomic,strong)NSNumber *favorite_count;
@property (nonatomic,strong)NSNumber *has_favorited;
@property (nonatomic,strong)NSString<Optional> *icon_url;
@property (nonatomic,strong)NSNumber *Did;
@property (nonatomic,strong)NSNumber *is_root;
@property (nonatomic,strong)NSNumber *like_count;
@property (nonatomic,strong)NSNumber *like_id;
@property (nonatomic,strong)NSString *msg;
//@property (nonatomic,strong)NSNumber *next_id;
@property (nonatomic,strong)ContentPhoto *photo;
//@property (nonatomic,strong)NSNumber *prev_id;
@property (nonatomic,strong)NSArray<Contentrelated> *related_albums;
@property (nonatomic,strong)NSNumber *reply_count;
@property (nonatomic,strong)ContentSender *sender;
@property (nonatomic,strong)NSNumber *sender_id;
@property (nonatomic,strong)NSDictionary *share_links_2;
@property (nonatomic,strong)NSDictionary *shareLinks_2;
@property (nonatomic,strong)NSArray *tags;
@property (nonatomic,strong)NSDictionary *top_comments;
@property (nonatomic,strong)NSArray *top_like_users;

@end

@interface ContentPhoto : JSONModel
@property (nonatomic,strong)NSString *path;
@property (nonatomic,strong)NSNumber *height;
@property (nonatomic,strong)NSNumber *width;
@end

@interface ContentSender : JSONModel
@property (nonatomic,strong)NSString *avatar;
@property (nonatomic,strong)NSNumber *Cid;
@property (nonatomic,strong)NSString *username;
@end

@interface ContentAlbum : JSONModel
@property (nonatomic,strong)NSNumber *category;
@property (nonatomic,strong)NSNumber *count;
@property (nonatomic,strong)NSArray *covers;
@property (nonatomic,strong)NSNumber *Bid;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSNumber *status;
@end

@class ContentrelatedUser;
@interface Contentrelated : JSONModel
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSNumber *Aid;
@property (nonatomic,strong)ContentrelatedUser *user;
@property (nonatomic,strong)NSArray *covers;

@end

@interface ContentrelatedUser : JSONModel
@property (nonatomic,strong)NSString *username;
@property (nonatomic,strong)NSNumber *AiD;
@property (nonatomic,strong)NSString *avatar;
@end





