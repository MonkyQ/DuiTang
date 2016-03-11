//
//  DTDetailImageView.m
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDetailImageView.h"
#import "DTDetailFrame.h"
#import "DTDetail.h"
#import "DTRelated.h"
#import "UIImageView+webcache.h"
#import "UIView+ViewController.h"
#import "DTWaterFlowController.h"

#define specialCount 3

@interface DTDetailImageView ()
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UILabel *usernameLabel;

@end
@implementation DTDetailImageView

-(id)init
{
    if (self = [super init]) {
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:12];
        
        
        UILabel *usernameLabel = [[UILabel alloc]init];
        [self addSubview:usernameLabel];
        self.usernameLabel = usernameLabel;
        usernameLabel.textColor = [UIColor whiteColor];
        usernameLabel.font = [UIFont systemFontOfSize:11];
        self.userInteractionEnabled = YES;

       UITapGestureRecognizer * tap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(panClick:)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self panClick];
//}
//

-(void)panClick:(UITapGestureRecognizer *)pan

{
    NSLog(@"panClick  panClick  panClick");
    NSString *str = self.model.cid;
     NSString *waterStr = [NSString stringWithFormat:@"%@id=%@%@",str1,str,str3];
    DTWaterFlowController *water = [[DTWaterFlowController alloc]init];
    water.urlStr = waterStr;
    [self.viewController.navigationController pushViewController:water animated:YES];
}

-(void)setModel:(DTRelated *)model
{
    _model = model;
    
   
    self.nameLabel.text = model.name;
    self.nameLabel.x = homePedding;
    self.nameLabel.y = self.height*2/3;
    self.nameLabel.size = [model.name sizeWithFont:[UIFont systemFontOfSize:12]];
    
    self.usernameLabel.text = [NSString stringWithFormat:@"by %@",model.user.username];
    self.usernameLabel.x = homePedding;
    self.usernameLabel.y = CGRectGetMaxY(self.nameLabel.frame);
    self.usernameLabel.size = [self.usernameLabel.text sizeWithFont:[UIFont systemFontOfSize:11]];
 
}




@end
