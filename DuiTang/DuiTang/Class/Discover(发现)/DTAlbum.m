//
//  DTAlbum.m
//  DuiTang
//
//  Created by Monky on 16/3/11.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTAlbum.h"
#import "UIKit+AFNetworking.h"

@implementation DTAlbum

- (void)configureModel:(Content *)model
{
    //title
    UILabel *titleLabel = [[UILabel alloc]init];
    [self addSubview:titleLabel];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.text = @"收集到以下专辑";
    titleLabel.textColor = [UIColor colorWithWhite:0.600 alpha:1.000];
   CGFloat width = [UIScreen mainScreen].bounds.size.width-24;
    titleLabel.frame = CGRectMake(10, 10, 150, 30);
    //箭头
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
    [self addSubview:image];
    CGFloat w = 15;
    CGFloat x = width-20-10;
    image.frame = CGRectMake(x, 17, w, w);
    
    UIScrollView *scView = [[UIScrollView alloc]init];
    scView.frame = CGRectMake(-10, 50, width, 100);
    scView.contentInset = UIEdgeInsetsMake(0, 20, 0, 0);
    scView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scView];
    for (int i=0; i<model.related_albums.count; i++) {
       
        Contentrelated *related = model.related_albums[i];
        UIImageView *ablumView = [[UIImageView alloc]init];
        NSString *str =[related.covers firstObject];
      [ablumView setImageWithURL:[NSURL URLWithString:str]];
        [scView addSubview:ablumView];
        CGFloat edge = 10;
        CGFloat w = width/3-edge;
        CGFloat x = i*(edge + w);
        CGFloat y = 10;
        ablumView.frame = CGRectMake(x, y, w, w);
        
        UIGestureRecognizer *g = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(touchImage)];
        [ablumView addGestureRecognizer:g];
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = related.name;
        nameLabel.font = [UIFont boldSystemFontOfSize:13];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.frame = CGRectMake(4, w-28, w, 10);
        [ablumView addSubview:nameLabel];
        
        ContentrelatedUser *user = related.user;
        UILabel *author = [[UILabel alloc]init];
        author.text = [NSString stringWithFormat:@"by %@",user.username];
        author.font = [UIFont systemFontOfSize:12];
        author.textColor = [UIColor whiteColor];
        author.frame = CGRectMake(4, w-14, w, 10);
        [ablumView addSubview:author];
        
        
        self.Height = y+w;
        self.Width = (w+edge) * i+w;
    }
    scView.contentSize = CGSizeMake(self.Width, 0);
}

- (void)touchImage
{
    
}

@end
