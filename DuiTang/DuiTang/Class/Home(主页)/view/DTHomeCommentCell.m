//
//  DTHomeCommentCell.m
//  DuiTang
//
//  Created by 苏威 on 16/3/11.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTHomeCommentCell.h"

#import "DTCommentFrame.h"
#import "DTComment.h"
#import "DTSender.h"

#import "UIImageView+webcache.h"
@interface DTHomeCommentCell ()

@property (nonatomic , weak)UIView *topView;
@property (nonatomic , weak)UILabel * timeLabel;
@property (nonatomic , weak)UIImageView * headerImageView;
@property (nonatomic , weak)UILabel * nameLabel;
@property (nonatomic , weak)UIButton * contentButton;
@property (nonatomic , weak)UIView *toolView;
@property (nonatomic , weak)UIView *replayView;

@end
@implementation DTHomeCommentCell

+(id)homeCommentCellWithTableView:(UITableView *)tableView
{
    
    NSString * className = NSStringFromClass([self class]);
    [tableView registerClass:[self class] forCellReuseIdentifier:className];
    return [tableView dequeueReusableCellWithIdentifier:className];
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //创建可重用的子控件
        //这个控件是作为一个整体，包住下面的控件
        
        UIView *topView = [[UIView alloc]init];
        [self.contentView addSubview:topView];
        self.topView = topView;
        
        //1.headerImageView
        UIImageView * headerImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:headerImageView];
        headerImageView.layer.cornerRadius = 20;
        headerImageView.clipsToBounds = YES;
        self.headerImageView = headerImageView;
        
        //2.nameLabel
        UILabel * nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        self.nameLabel.font = [UIFont boldSystemFontOfSize:10];
        nameLabel.textColor = [UIColor blueColor];
        
        //3.timeLabel
        UILabel * timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        timeLabel.font = [UIFont systemFontOfSize:10];;
       
        
        
        
        //4.contentButton
        UIButton * contentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:contentButton];
        self.contentButton = contentButton;
        
        contentButton.titleLabel.font = titleFont;
        [contentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        contentButton.backgroundColor = [UIColor redColor];
        contentButton.titleLabel.numberOfLines = 0;
        contentButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        
        
        
        UIView *toolView = [[UIView alloc] init];
        [self.contentView addSubview:toolView];
        self.toolView = toolView;
        
        
        UIView *replayView = [[UIView alloc]init];
        [self.contentView addSubview:replayView];
        self.replayView = replayView;
        
        
    }
    return self;
}



-(void)setCommentF:(DTCommentFrame *)commentF
{
    _commentF = commentF;
    DTComment *comment = commentF.comment;
    DTSender *sender = comment.sender;
    
    //头像
    self.headerImageView.frame = commentF.headImageFrame;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:sender.avatar]];
    
    //name
    self.nameLabel.frame = commentF.nameFrame;
    self.nameLabel.text  = sender.username;
    
    self.timeLabel.frame = commentF.timeLabelFrame;
    self.timeLabel.text = @"7月前";
    
    //内容
    self.contentButton.frame = commentF.contentFrame;
    UIImage *image = [UIImage imageNamed:@"chat_recive_press_pic"];
    image = [self resizeImageWithImage:image];
    [self.contentButton setBackgroundImage:image forState:UIControlStateNormal];
    [self.contentButton setTitle:comment.content forState:UIControlStateNormal];
    
}

//拉伸图片保证图片不变形的方法
-(UIImage *)resizeImageWithImage:(UIImage *)image
{
    CGFloat x = image.size.width * 0.5; //100 * 0.5
    CGFloat y = image.size.height * 0.5;
    CGFloat w = x;
    CGFloat h = y;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(x, y, w, h)];
}
@end
