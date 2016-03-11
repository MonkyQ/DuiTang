//
//  DTDiscoverViewController.m
//  DuiTang
//
//  Created by Monky on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDiscoverViewController.h"
#import "DTNetHelper.h"
#import "DTTitleModel.h"
#import "DTTitleCell.h"
#import "DTDetailViewController.h"

static NSString * const DTTitleCellId = @"Title";
@interface DTDiscoverViewController ()
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)DTTitleModel *model;
@end

@implementation DTDiscoverViewController

- (NSMutableArray *)dataArray
{
    if (_dataArray ==nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTableView];
    //数据下载
    [self downloadData];
   }

//创建表格
- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCRW, SCRH - NAVH - TabbarH - 20) style:UITableViewStylePlain];
    self.tableView.separatorStyle = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.userInteractionEnabled = YES;
    self.tableView.showsVerticalScrollIndicator = NO;
}

- (void)downloadData
{
    
    __weak typeof(self) weakSelf = self;
    [DTNetHelper getDataWithParam:nil andPath:@"http://www.duitang.com/napi/index/groups/?locale=zh_CN&device_name=Unknown%20iPhone&app_version=6.0.1%20rv%3A153547&platform_version=9.2.1&app_code=gandalf&platform_name=iPhone%20OS&device_platform=iPhone6%2C2&screen_height=568&screen_width=320&__domain=www.duitang.com" andComplete:^(BOOL success, id result) {
        if (success) {
            NSError *error;
            //JSONModel解析
            weakSelf.model = [[DTTitleModel alloc] initWithData:result error:&error];
            self.dataArray =weakSelf.model.data;
            [self.dataArray removeObjectAtIndex:0];
            [self.dataArray removeObjectAtIndex:0];
            
       //     NSLog(@"dataArraydataArraydataArraydataArray%lu", self.dataArray.count);
            NSLog(@"%@",error);
            //刷新表格
            [weakSelf.tableView reloadData];
        }else
        {
            NSLog(@"错误:%@",result);
        }
    }];
    
}

#pragma mark-----------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

  //  NSLog(@"%lu",(unsigned long)self.model.data.count);
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        Data *data =self.dataArray.firstObject;
        return data.group_items.count;
    }else if (section == 1)
    {
        Data *data =[self.dataArray objectAtIndex:1];
        return data.group_items.count;
    }else{
        Data *data =[self.dataArray objectAtIndex:2];
        return data.group_items.count;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        Data *data =self.dataArray.firstObject;
        return data.group_name;
    }else if (section == 1)
    {
        Data *data =[self.dataArray objectAtIndex:1];
        return data.group_name;
    }else{
        Data *data =[self.dataArray objectAtIndex:2];
        return data.group_name;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DTTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:DTTitleCellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DTTitleCell class]) owner:nil options:nil] lastObject];
    }

    Data *data =self.model.data[indexPath.section];
    Group *model =data.group_items[indexPath.row];
    [cell configureModel:model];
  //   NSLog(@"%@++++++++++++++",model);
    return cell;
}

#pragma mark-------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DTDetailViewController *dtVC = [[DTDetailViewController alloc]init];
    dtVC.hidesBottomBarWhenPushed = YES;
    dtVC.view.backgroundColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
    Data *data =self.model.data[indexPath.section];
    Group *model =data.group_items[indexPath.row];
   // NSString *target = model.target;
    dtVC.navigationItem.title =model.name;
    dtVC.cat_key = model.target;
    [self.navigationController pushViewController:dtVC animated:YES];
}
@end
