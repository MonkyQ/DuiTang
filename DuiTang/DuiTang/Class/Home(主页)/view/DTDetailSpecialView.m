//
//  DTDetailSpecialView.m
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDetailSpecialView.h"
#import "DTDetailFrame.h"
#import "DTDetail.h"
#import "DTRelated.h"
#import "DTDetailImageView.h"

#import "UIImageView+webcache.h"

#define specialCount 3
@interface DTDetailSpecialView ()
@property (nonatomic , weak)UILabel *titleLabel;
@property (nonatomic ,weak)UIScrollView *scroll;


@end

@implementation DTDetailSpecialView
-(id)init
{
    if (self = [super init]) {
        
        UILabel *titleLabel = [[UILabel alloc]init];
        [self addSubview:titleLabel];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.text = @"收集到以下专辑";
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        self.titleLabel = titleLabel;
         titleLabel.backgroundColor = [UIColor whiteColor];
        
        UIScrollView *scroll = [[UIScrollView alloc]init];
        scroll.userInteractionEnabled = YES;
        //[scroll removeGestureRecognizer:scroll.panGestureRecognizer];
        scroll.backgroundColor = [UIColor whiteColor];
        [self addSubview:scroll];
        self.scroll = scroll;
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.showsVerticalScrollIndicator = NO;
        [self addGestureRecognizer:scroll.panGestureRecognizer];
    }
    return self;
}

-(void)setModel:(DTDetailFrame *)model
{
    _model = model;
    
    DTDetail *detail = model.detail;
    NSArray *arr = detail.related_albums;
   
    
    self.titleLabel.frame = model.specialLabelFrame;
    
    self.scroll.frame = model.specialScrollFrame;
    CGFloat width =( self.scroll.width-(specialCount+1)*homePedding)/specialCount;
  //  NSLog(@"%@",arr);
    if (arr.count >0) {
        for (int i = 0; i<arr.count; i++) {
            DTRelated *related = arr[i];
           // NSLog(@"%@",NSStringFromClass([related class]));
            NSString * str = [related.covers firstObject];
            DTDetailImageView *imageView = [[DTDetailImageView alloc]init];
            [imageView sd_setImageWithURL:[NSURL URLWithString:str]];
            
            [self.scroll addSubview:imageView];
            imageView.width = width;
            imageView.height = width;
            imageView.x = homePedding +(width +homePedding)*i;
            imageView.y = homePedding;
            if (i==0) {
                UILabel *labal = [[UILabel alloc]init];
                labal.backgroundColor = [UIColor redColor];
                labal.text = @"首发";
                labal.textAlignment = NSTextAlignmentCenter;
                labal.font = [UIFont systemFontOfSize:10];
                labal.x = -5;
                labal.y = -6;
                labal.size = CGSizeMake(30, 20);
                [imageView addSubview:labal];
                
            }
            imageView.model = related;
        }
    }
    
    
    self.scroll.contentSize = CGSizeMake(arr.count *(width+homePedding),0);
    
    
    self.frame = model.specialViewFrame;
    
    
    
}
@end
