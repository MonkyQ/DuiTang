//
//  DTDisHeadview.m
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDisHeadview.h"
#import "DTDiscussFrame.h"
#import "DTClub.h"
#import "DTPhoto.h"
#import "DTDiscuss.h"
#import "DTSender.h"

#import "UIImageView+webcache.h"

@interface DTDisHeadview ()
@property (nonatomic , weak) UILabel *fromLabel;
@property (nonatomic , weak) UIImageView *iconImage;
@property (nonatomic , weak) UILabel *contentLabel;
@property (nonatomic , weak) UILabel *nameLabel;
@property (nonatomic , weak)UILabel *timeLabel;
@property (nonatomic , weak) UILabel *seeCountLabel;
@end

@implementation DTDisHeadview

-(id)init
{
    if (self = [super init]) {
        
        
        UILabel *fromLabel = [[UILabel alloc]init];
        [self addSubview:fromLabel];
        self.fromLabel = fromLabel;
        fromLabel.font = [UIFont systemFontOfSize:14];
        
        UILabel *contentLabel = [[UILabel alloc] init];
        [self addSubview:contentLabel];
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont boldSystemFontOfSize:15];
        self.contentLabel = contentLabel;
        
        UIImageView *iconImage = [[UIImageView alloc]init];
        [self addSubview:iconImage];
        self.iconImage = iconImage;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        nameLabel.textColor = [UIColor blueColor];
        nameLabel.font = [UIFont systemFontOfSize:14];
        
        UILabel *timeLabel = [[UILabel alloc]init];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        timeLabel.font = [UIFont systemFontOfSize:10];
        
        
        UILabel *seeCountLabel = [[UILabel alloc]init];
        [self addSubview:seeCountLabel];
        self.seeCountLabel = seeCountLabel;
        seeCountLabel.numberOfLines = 0;
        seeCountLabel.font = [UIFont systemFontOfSize:14];
        
        
        
        
    }
    return self;
}

-(void)setDiscussF:(DTDiscussFrame *)discussF
{
    _discussF = discussF;
    DTDiscuss *discuss = discussF.discuss;
    DTClub *club = discuss.club;
    //NSLog(@"%@",club);
    DTSender *sender = discuss.sender;
    DTPhoto *photo = [discuss.photos lastObject];
    self.fromLabel.frame = discussF.fromLabelFrame;
    self.fromLabel.text = [NSString stringWithFormat:@"来自 %@",club.name];
    
    self.contentLabel.frame = discussF.contentLabelFrame;
    self.contentLabel.text = discuss.content;
    
    self.iconImage.frame = discussF.iconFrame;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:photo.path]];
    
    self.nameLabel.frame = discussF.nameLabelFrame;
    self.nameLabel.text = sender.username;
    
    //时间
    double from = [discuss.active_time doubleValue];
    double to = [discuss.add_datetime_ts doubleValue];
    int day = (int)(from - to)/60/60/24;
    NSString *str =nil;
    if (day<=1) {
        str = @"今天";
    }else {
        str = [NSString stringWithFormat:@"%d天前",day];
    }
    self.timeLabel.frame = discussF.timeLabelFrame;
    self.timeLabel.text = str;
    
    NSString *countStr = [NSString stringWithFormat:@"游览 %@次",discuss.visit_count];

    NSLog(@"%@",countStr);
    self.seeCountLabel.frame = discussF.seeCountLabelFrame;
    self.seeCountLabel.text = countStr;
    
    self.height = discussF.maxHight;
    
}
-(void)setFrame:(CGRect)frame
{
    
    frame.origin.x+=homePedding;
    frame.size.width-=(2*homePedding);
    [super setFrame:frame];
}
@end
