//
//  DTAlbum.m
//  DuiTang
//
//  Created by Monky on 16/3/11.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTAlbums.h"
#import "UIKit+AFNetworking.h"
#import "UIView+ViewController.h"
#import "DTWaterFlowController.h"
#import "DTDisCoverAlbum.h"

@interface DTAlbums ()

@property (nonatomic,strong)Content *content;

@end

@implementation DTAlbums

- (void)configureModel:(Content *)model
{
    self.content = model;
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
        DTDisCoverAlbum *ablumView = [[DTDisCoverAlbum alloc]init];
        ablumView.userInteractionEnabled = YES;
        ablumView.dId = related.Aid.stringValue;
        NSString *str =[related.covers firstObject];
      [ablumView setImageWithURL:[NSURL URLWithString:str]];
        [scView addSubview:ablumView];
        CGFloat edge = 10;
        CGFloat w = width/3-edge;
        CGFloat x = i*(edge + w);
        CGFloat y = 10;
        ablumView.frame = CGRectMake(x, y, w, w);
        
        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchImage:)];
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

- (void)touchImage:(UITapGestureRecognizer *)g
{
    NSLog(@"手势方法");
    DTDisCoverAlbum *album = (DTDisCoverAlbum *)g.view;
        //Aid
        NSString *str1 = @"http://www.duitang.com/napi/blog/list/by_album/?platform_name=iPhone%20OS&start=0&__dtac=%257B%2522_r%2522%253A%2520%2522458242%2522%257D&__domain=www.duitang.com&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&app_version=6.0.1%20rv%3A153547&device_platform=iPhone6%2C2&user_id=4404986&app_code=gandalf&locale=zh_CN&platform_version=9.2.1&screen_height=568&device_name=Unknown%20iPhone&limit=0&sender_id=0&screen_width=320&";
        NSString *str2 = [NSString stringWithFormat:@"album_id=%@",album.dId];
        NSString *path = [NSString stringWithFormat:@"%@%@",str1,str2];

    NSLog(@"手势方法%@",path);
    DTWaterFlowController *waterVC = [[DTWaterFlowController alloc]init];
    waterVC.urlStr = path;
    [self.viewController.navigationController pushViewController:waterVC animated:YES];

}

@end
