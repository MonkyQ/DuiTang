//
//  DTWaterFlowController.m
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTWaterFlowController.h"
#import "XMGWaterflowLayout.h"
#import "DTNetHelper.h"
#import "MJExtension.h"
#import "MJRefresh.h"

#import "DTWaterFrame.h"
#import "DTWaterModel.h"
#import "DTWaterFlowCell.h"
#import "DTPhoto.h"

#import "DTReusableView.h"
#import "DTDetailViewController.h"

@interface DTWaterFlowController ()<UICollectionViewDataSource,XMGWaterflowLayoutDelegate,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic ,weak)UICollectionView *coll;
@property (nonatomic ,strong)NSMutableArray *modelArray;
@end

@implementation DTWaterFlowController
-(NSMutableArray *)modelArray{
    if (_modelArray==nil) {
        _modelArray=[NSMutableArray array];
    }
    return _modelArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    [self loadData];
    
     [self setupColltionView];
    [self setupRefresh];
    
}

-(void)setupRefresh
{
    self.coll.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
        
    }];
    [self.coll.mj_header beginRefreshing];
}

-(void)setupColltionView

{
    //配置collectionview
    XMGWaterflowLayout *layout = [[XMGWaterflowLayout alloc]init];
    layout.delegate = self;
   
    UICollectionView *coll = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    //coll.frame = self.view.frame;
    [self.view addSubview:coll];
   // coll.pagingEnabled = YES;
    coll.showsHorizontalScrollIndicator = NO;
    self.coll = coll;
    coll.backgroundColor = DTGlobalBg;
    coll.dataSource = self;
    coll.delegate = self ;
    
   
}


-(void)loadData
{
    [self.modelArray removeAllObjects];
    [DTNetHelper getDataWithParam:nil andPath:self.urlStr andComplete:^(BOOL success, id result) {
        if (success) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dataDict = dict[@"data"];
            NSArray *arr = dataDict[@"object_list"];
            NSMutableArray *marr = [NSMutableArray array];
            for (NSDictionary *smallDict in arr ) {
                DTWaterModel *model = [DTWaterModel mj_objectWithKeyValues:smallDict];
                DTWaterFrame *frameModel = [[DTWaterFrame alloc]init];
                frameModel.model = model;
                [marr addObject:frameModel];
                
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                [self.coll.mj_header endRefreshing];
                [self.modelArray addObjectsFromArray:marr];
                
           
                [self.coll reloadData];
                
            });
        }
        
        
    }];

    
}


#pragma  mark XMGWaterflowLayoutDelegate

-(CGFloat)waterflowLayout:(XMGWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth

{
   
    DTWaterFrame *model = self.modelArray [index];
        return model.maxHight;
}

- (CGFloat)columnCountInWaterflowLayout:(XMGWaterflowLayout *)waterflowLayout
{
    return maxColum;
    
}




#pragma mark datasourcedelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.modelArray.count;
}








// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    DTWaterFrame *model = self.modelArray[indexPath.item];
    DTWaterFlowCell *cell = [DTWaterFlowCell waterFlowCellWithNibWithCollnectionView:collectionView andIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.model = model;
    
    return cell;
}

//
//-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    //配置3D内容
//    CATransform3D transform ;
//    transform = CATransform3DMakeRotation((90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    transform.m34 = 1.0/-600;
//    
//    
//    //设置cell的初始状态
//    cell.layer.shadowColor = [UIColor blackColor].CGColor ;
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    
//    cell.layer.transform = transform;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    
//    //定义cell的最终状态， 并提交动画
//    [UIView beginAnimations:@"transform" context:nil];
//    [UIView setAnimationDuration:0.5];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    //cell.frame = cell.frame;
//    
//    [UIView commitAnimations];
//}






-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DTWaterFrame *modelF = self.modelArray[indexPath.item];
    DTWaterModel *model = modelF.model;
    DTDetailViewController * detailVc = [[DTDetailViewController alloc]init];
    NSString *urlStr = [NSString stringWithFormat:@"%@id=%@%@",detailStr1,model.cid,detailStr2];
    
    detailVc.urlStr = urlStr;
    detailVc.hidesBottomBarWhenPushed = YES;

    
    [self.navigationController pushViewController:detailVc animated:YES];
    
}




//
//
////分组头,分组尾视图
////1.要显示什么的头部视图
////2.要显示什么样的尾部视图
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    /*
//     UICollectionReusableView * resueView = [[UICollectionReusableView alloc] init];
//     resueView.backgroundColor = [UIColor greenColor];
//     return resueView;
//     */
//    
//    //UICollectionElementKindSectionHeader 分组头
//    //UICollectionElementKindSectionFooter 分组尾
//    UICollectionReusableView * reView = nil;
//    
//    if([kind isEqualToString:UICollectionElementKindSectionHeader])
//    {
//        //注册,分组头
//        [collectionView registerClass:[DTReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
//        //在缓存池中找,是否存在可重用的分组头部视图,如果有返回,如果没有创建一个新的返回
//        reView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
//        //设置背景颜色
//        reView.backgroundColor = [UIColor greenColor];
//        
//    }
//    else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
//    {
//        [collectionView registerClass:[DTReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
//        
//        reView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
//        reView.backgroundColor = [UIColor grayColor];
//        
//    }
//    
//    return reView;
//    
//    
//}//end method
//
////设置分组头部显示的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(375, 200);
//}




@end
