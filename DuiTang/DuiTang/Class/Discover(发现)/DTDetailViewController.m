//
//  DTDetailViewController.m
//  DuiTang
//
//  Created by Monky on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDetailViewController.h"
#import "MKWaterflowLayout.h"
#import "DTDetailCollectionViewCell.h"
#import "DTNetHelper.h"
#import "DTDetailModel.h"
#import "MJRefresh.h"

#import "DTContentViewController.h"

@interface DTDetailViewController ()<MKWaterflowLayoutDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSInteger _currentPage;
}
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic,strong)DTDetailModel *model;
@property (nonatomic,strong)NSMutableArray *detailArr;

@end
static NSString *cellID = @"DTDetailCollectionViewCell";
@implementation DTDetailViewController

- (NSMutableArray *)detailArr
{
    if (_detailArr == nil) {
        _detailArr = [NSMutableArray array];
    }
    return _detailArr;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayout];
    //[self downloadData];
    [self setupRefresh];
}

- (void)setupRefresh
{
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downloadData)];
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
 
}


- (void)downloadData
{
    _currentPage = 0;
  NSString *par = [self.cat_key stringByReplacingOccurrencesOfString:@"duitang://www.duitang.com/blog/list/category/?id=" withString:@""];
    __weak typeof(self) weakSelf = self;
    NSString *p1 =@"http://www.duitang.com/napi/blog/list/by_category/?platform_name=iPhone%20OS&start=0&__domain=www.duitang.com&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&app_version=6.0.1%20rv%3A153547&filter_params=%7B%0A%0A%7D&device_platform=iPhone6%2C2&app_code=gandalf&locale=zh_CN&platform_version=9.2.1&screen_height=568&device_name=Unknown%20iPhone&limit=0&";
    NSString *p2 = [NSString stringWithFormat:@"cate_key=%@",par];
    NSString *p3 = @"&screen_width=320&__dtac=%257B%2522_r%2522%253A%2520%2522870068%2522%257D";
    NSString *path = [NSString stringWithFormat:@"%@%@%@",p1,p2,p3];
   // NSLog(@"path%@",path);
    [DTNetHelper getDataWithParam:nil andPath:path andComplete:^(BOOL success, id result) {
        if (success) {
            NSError *error;
            [self.detailArr removeAllObjects];
            //JSONModel解析
            weakSelf.model = [[DTDetailModel alloc] initWithData:result error:&error];
            self.detailArr = [NSMutableArray arrayWithArray: weakSelf.model.data.object_list];
          //  NSLog(@"dataArraydataArraydataArraydataArray%lu", self.detailArr.count);
          //  NSLog(@"%@",error);
            // 刷新数据
            [self.collectionView reloadData];
            
            [self.collectionView.mj_header endRefreshing];
        }else
        {
            NSLog(@"错误:%@",result);
        }
    }];
}
- (void)loadMoreData
{
    __weak typeof(self) weakSelf = self;
    _currentPage += 24;
     NSString *par = [self.cat_key stringByReplacingOccurrencesOfString:@"duitang://www.duitang.com/blog/list/category/?id=" withString:@""];
    
    NSString *p1 = @"http://www.duitang.com/napi/blog/list/by_category/?platform_name=iPhone%20OS&";
    NSString *p2 = [NSString stringWithFormat:@"start=%ld",(long)_currentPage];
    NSString *p3 = @"&__domain=www.duitang.com&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&app_version=6.0.1%20rv%3A153547&filter_params=%7B%0A%0A%7D&device_platform=iPhone6%2C2&app_code=gandalf&locale=zh_CN&platform_version=9.2.1&screen_height=568&device_name=Unknown%20iPhone&limit=0&";
    NSString *p4 = [NSString stringWithFormat:@"cate_key=%@",par];
     NSString *p5 = @"&screen_width=320&__dtac=%257B%2522_r%2522%253A%2520%2522870068%2522%257D";
    NSString *path = [NSString stringWithFormat:@"%@%@%@%@%@",p1,p2,p3,p4,p5];
    
    NSLog(@"%@",path);
    
    [DTNetHelper getDataWithParam:nil andPath:path andComplete:^(BOOL success, id result) {
        if (success) {
            NSError *error;
            //JSONModel解析
            weakSelf.model = [[DTDetailModel alloc] initWithData:result error:&error];
            [self.detailArr addObjectsFromArray:weakSelf.model.data.object_list];
            NSLog(@"%@",error);
            // 刷新数据
            [self.collectionView reloadData];
            
            [self.collectionView.mj_header endRefreshing];
        }else
        {
            NSLog(@"错误:%@",result);
        }
    }];

}
- (void)setupLayout
{
    // 创建布局
    MKWaterflowLayout *layout = [[MKWaterflowLayout alloc] init];
    layout.delegate = self;
    
    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    collectionView.backgroundColor = [UIColor colorWithWhite:0.858 alpha:1.000];
    // 注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DTDetailCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:cellID];
    
    self.collectionView = collectionView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.detailArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DTDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    DetaiList *model = self.detailArr[indexPath.item];
    [cell configureModel:model];
    return cell;
}

#pragma mark - <XMGWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(MKWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    DetaiList *list = self.detailArr[index];
    DetaiListPhoto *photo = list.photo;
    CGFloat h = photo.height.doubleValue;
    CGFloat w = photo.width.doubleValue;
    
    NSDictionary *titleDict = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]};
    CGFloat titleH = [list.msg boundingRectWithSize:CGSizeMake(w, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:titleDict context:nil].size.height;
    return itemWidth * h / w +titleH+18;
}

- (CGFloat)rowMarginInWaterflowLayout:(MKWaterflowLayout *)waterflowLayout
{
    return 12;
}

- (CGFloat)columnCountInWaterflowLayout:(MKWaterflowLayout *)waterflowLayout
{
    
    return 2;
}

- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(MKWaterflowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(12, 12, 12, 12);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"0.0");
    DTContentViewController *contentVC = [[DTContentViewController alloc]init];
    contentVC.navigationItem.title = @"详情";
    DetaiList *model = self.detailArr[indexPath.item];
    contentVC.number = model.Did;
    [self.navigationController pushViewController:contentVC  animated:YES];
}

@end
