//
//  DTStoreViewController.m
//  DuiTang
//
//  Created by Monky on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTStoreViewController.h"
//#import <>
#import "DTReadCell.h"
#import "DTReadModel.h"
#import "DTWebController.h"
#import "CCEaseRefresh.h"
#import <MJRefresh.h>
@interface DTStoreViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;
//存的是readmod
@property (nonatomic,strong) NSArray * dataArray;
//刷新控件
@property (nonatomic,strong)MJRefreshHeader * refresh;
//下拉刷新最后一个
@property (nonatomic,assign)NSInteger start;
//上啦刷新
@end

@implementation DTStoreViewController
-(NSArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray=[NSArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.start=0;
    self.view.backgroundColor = [UIColor colorWithRed:0.539 green:0.683 blue:1.000 alpha:1.000];
    [self configTableView];
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self downLoadData];
    }];
    
    self.tableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self downloadAppendData];
    }];
    
    [self downLoadData];
}
-(void)configTableView
{
    self.tableView=[[UITableView alloc]init];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.top.equalTo(0);
        make.bottom.equalTo(0);
    }];
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(NAVH+20, 0, TabbarH, 0);
    self.tableView.contentInset = UIEdgeInsetsMake(NAVH+20, 0, TabbarH, 0);
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
}
/**
 *  加载数据以及上拉刷新
 */
-(void)downLoadData
{

    [DTNetHelper getDataWithParam:nil andPath:@"http://203.80.144.212/napi/topic/article/list/?platform_name=iPhone%20OS&start=0&__domain=www.duitang.com&app_version=6.0.1%20rv%3A153547&device_platform=iPhone6%2C2&app_code=gandalf&locale=zh_CN&platform_version=9.2.1&screen_height=568&type=by_banner&device_name=Unknown%20iPhone&limit=0&screen_width=320&__dtac=%257B%2522_r%2522%253A%2520%2522742678%2522%257D" andComplete:^(BOOL success, id result) {
        if (success)
        {
            NSLog(@"请求成功");
            NSError * error;
            Root * root=[[Root alloc]initWithData:result error:&error];
            if (error)
            {
                NSLog(@"%@",error);
                return;
            }
            self.dataArray=root.data.object_list;
            [self.tableView reloadData];
            self.start=25;
        }
        else
        {
            NSLog(@"请求失败");
        }
        
        //请求结束，结束控件
        [self.tableView.mj_header endRefreshing];
    }];
}
/**
 *  刷新数据
 */
-(void)downloadAppendData
{
    if (self.start==0)
    {
        return;
    }
    NSString * path1=@"http://203.80.144.212/napi/topic/article/list/?platform_name=iPhone%20OS";
    NSString * path2=[NSString stringWithFormat:@"&start=%ld",self.start];
    NSString * path3=@"&__domain=www.duitang.com&app_version=6.0.1%20rv%3A153547&device_platform=iPhone6%2C2&app_code=gandalf&locale=zh_CN&platform_version=9.2.1&screen_height=568&type=by_banner&device_name=Unknown%20iPhone&limit=0&screen_width=320&__dtac=%257B%2522_r%2522%253A%2520%2522742678%2522%257D";
    NSString * path=[NSString stringWithFormat:@"%@%@%@",path1,path2,path3];
    //获取数据
    [DTNetHelper getDataWithParam:nil andPath:path andComplete:^(BOOL success, id result) {
            if (success)
            {
                NSLog(@"请求成功");
                NSError * error;
                Root * root=[[Root alloc]initWithData:result error:&error];
                if (error)
                {
                    NSLog(@"%@",error);
                    return;
                }
                NSMutableArray * array=[NSMutableArray arrayWithArray:self.dataArray];
                [array addObjectsFromArray:root.data.object_list];
                self.dataArray=array;
                self.start=self.dataArray.count;
                [self.tableView reloadData];
            }
            else
            {
                NSLog(@"请求失败");
            }
            
            //请求结束，结束控件
            [self.tableView.mj_footer endRefreshing];
        }];
    
}
#pragma UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTReadCell * cell=[DTReadCell cellWithTableView:tableView];
    [cell setmodel:self.dataArray[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTReadModel * mod=self.dataArray[indexPath.row];
    DTWebController * web=[DTWebController dtWebControllerWithID:mod.ID];
    [self.navigationController pushViewController:web animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
