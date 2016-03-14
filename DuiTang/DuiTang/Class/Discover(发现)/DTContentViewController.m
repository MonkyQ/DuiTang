//  DTContentViewController.m
//  DuiTang
//
//  Created by Monky on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTContentViewController.h"
#import "DTNetHelper.h"
#import "DTContentModel.h"
#import "DTContentView.h"
#import "DTAlbums.h"
#import "UIControl+ActionBlocks.h"
/**
 *  0.0
 */

@interface DTContentViewController ()
{
    CGFloat _h;
}
@property (nonatomic,strong)DTContentModel *model;
@property (nonatomic,strong)NSDictionary *dataDict;
@property (nonatomic,strong)UITableView *tbView;
@property (nonatomic,strong)UIScrollView *scView;

@end

static NSString *ContentcellID =@"DTContentTableViewCell";
@implementation DTContentViewController

- (NSDictionary *)dataDict
{
    if (_dataDict ==nil) {
        _dataDict = [NSMutableDictionary dictionary];
    }
    return _dataDict;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.858 alpha:1.000];
    [self downloadData];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 30, 30);
    [leftBtn setImage:[UIImage imageNamed:@"icon_back_dark"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [leftBtn handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
}

- (void)downloadData
{
    //@"http://www.duitang.com/napi/blog/detail/?platform_name=iPhone%20OS&screen_width=320&__domain=www.duitang.com&include_fields=tags%2Crelated_albums%2Crelated_albums.covers%2Croot_album%2Cshare_links_2%2Cextra_html%2Ctop_comments%2Ctop_like_users&app_version=6.0.1%20rv%3A153547&device_platform=iPhone6%2C2&top_like_users_count=8&app_code=gandalf&locale=zh_CN&platform_version=9.2.1&screen_height=568&top_forward_users_count=8&device_name=Unknown%20iPhone&blog_id=545177192&top_comments_count=12&__dtac=%257B%2522_r%2522%253A%2520%2522355656%2522%257D"
    __weak typeof(self) weakSelf = self;
    
    NSString *str = @"http://www.duitang.com/napi/blog/detail/?platform_name=iPhone%20OS&screen_width=320&__domain=www.duitang.com&include_fields=tags%2Crelated_albums%2Crelated_albums.covers%2Croot_album%2Cshare_links_2%2Cextra_html%2Ctop_comments%2Ctop_like_users&app_version=6.0.1%20rv%3A153547&device_platform=iPhone6%2C2&top_like_users_count=8&app_code=gandalf&locale=zh_CN&platform_version=9.2.1&screen_height=568&top_forward_users_count=8&device_name=Unknown%20iPhone&";
    NSString *str1 = [NSString stringWithFormat:@"blog_id=%@",self.number];
    NSString *str2 = @"&top_comments_count=12&__dtac=%257B%2522_r%2522%253A%2520%2522355656%2522%257D";
    NSString *path = [NSString stringWithFormat:@"%@%@%@",str,str1,str2];
    
    [DTNetHelper getDataWithParam:nil andPath:path andComplete:^(BOOL success, id result) {
        if (success) {
            NSError *error;
        
            weakSelf.model = [[DTContentModel alloc] initWithData:result error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"dataArraydataArraydataArraydataArray%@", self.model);
                
                [self setupView];
                //刷新表格
                [weakSelf.tbView reloadData];
                
            });
            NSLog(@"请求成功");
        }else
        {       
            NSLog(@"------------%@",result);
        }
    }];
}


- (void)setupView
{
    UIScrollView *scView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20+NAVH, SCRW,SCRH-20-NAVH)];
    self.scView = scView;
    scView.showsVerticalScrollIndicator = NO;
    //图片部分
    DTContentView *conView = [[DTContentView alloc]init];
    Content *model = self.model.data;
    [conView configureModel:model];
    conView.frame = CGRectMake(12, 10, conView.Width, conView.Height);
    conView.backgroundColor = [UIColor whiteColor];
    //专辑部分
    DTAlbums *albumView = [[DTAlbums alloc]init];
    [albumView configureModel:model];
    albumView.frame = CGRectMake(11, conView.Height+20,conView.Width ,albumView.Height+60);
    albumView.backgroundColor = [UIColor whiteColor];
    
    _h = conView.Height + albumView.Height+90;
    NSLog(@"%f",_h);
    
    scView.contentSize = CGSizeMake(SCRW,_h);
    [self.view addSubview:scView];
    [self.scView addSubview:conView];
    [self.scView addSubview:albumView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
