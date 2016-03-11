
//  DTContentViewController.m
//  DuiTang
//
//  Created by Monky on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTContentViewController.h"
#import "DTNetHelper.h"
#import "DTContentModel.h"
//#import "DTContentTableViewCell.h"
#import "DTContentView.h"


@interface DTContentViewController ()
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
    UIScrollView *scView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20+NAVH, SCRW, SCRH - NAVH  - 20)];
    [self.view addSubview:scView];
    scView.backgroundColor =[UIColor colorWithWhite:0.800 alpha:1.000];   
    self.scView = scView;
}

- (void)downloadData
{    
    __weak typeof(self) weakSelf = self;
    [DTNetHelper getDataWithParam:nil andPath:@"http://203.80.144.213/napi/blog/detail/?platform_name=iPhone%20OS&screen_width=320&__domain=www.duitang.com&include_fields=tags%2Crelated_albums%2Crelated_albums.covers%2Croot_album%2Cshare_links_2%2Cextra_html%2Ctop_comments%2Ctop_like_users&app_version=6.0.1%20rv%3A153547&device_platform=iPhone6%2C2&top_like_users_count=8&app_code=gandalf&locale=zh_CN&platform_version=9.2.1&screen_height=568&top_forward_users_count=8&device_name=Unknown%20iPhone&blog_id=544506674&top_comments_count=12&__dtac=%257B%2522_r%2522%253A%2520%2522704612%2522%257D" andComplete:^(BOOL success, id result) {
        
        if (success) {
            NSError *error;
               weakSelf.model = [[DTContentModel alloc] initWithData:result error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{

                 [self setupView];
                //刷新表格
                [weakSelf.tbView reloadData];
            });
         
           // self.dataDict  = [NSDictionary dictionaryWithObject:weakSelf.model.data forKey:@"data" ];
            //刷新表格
           
            NSLog(@"请求成功");
        }else
        {
            NSLog(@"------------%@",result);
        }
    }];
}


- (void)setupView
{

    DTContentView *conView = [[DTContentView alloc]init];
    Content *model = self.model.data;
    NSLog(@"%@",model);
    [conView configureModel:model];
    conView.frame = CGRectMake(11, -50, conView.Width, conView.Height);
    [self.scView addSubview:conView];
    conView.backgroundColor = [UIColor whiteColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
