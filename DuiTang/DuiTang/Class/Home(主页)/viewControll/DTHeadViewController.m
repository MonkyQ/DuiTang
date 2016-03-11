//
//  DTHeadViewController.m
//  DuiTang
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTHeadViewController.h"
#import "DTHomeWebController.h"
#import "DTHeadCell.h"
#import "DTBigModelFrame.h"
#import "DTNetHelper.h"

#define maxSection 100

@interface DTHeadViewController ()<UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong)NSTimer *timer;
@property (nonatomic ,weak)UICollectionView *coll;

@property (nonatomic ,strong)UIPageControl *pageControll;

@end

@implementation DTHeadViewController

-(id)initWithFrame:(CGRect)frame
{
    if (self =[super init]) {
        
        self.view.frame =frame;
        [self setupColltionView];
    }
    return self;
}
-(void)setModelArray:(NSArray *)modelArray
{
    _modelArray = modelArray;
    if (self.timer==nil) {
        [self addTimer];
    }
    [self.coll reloadData ];
    //得到数据之后一定要刷新下界面，不然会崩溃
     [self setupPageControll];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor] ;
    //[self setupColltionView];
   
    // Do any additional setup after loading the view.
}



//配置setupPageControll 页数
-(void)setupPageControll
{
    UIPageControl *pageControll = [[UIPageControl alloc]init];
    //pageControll.backgroundColor = [UIColor redColor];
    [self.view addSubview:pageControll];
    [pageControll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(5);
        make.width.equalTo(self.view);
        make.height.equalTo(20);
        
    }];
    pageControll.numberOfPages = self.modelArray.count;
    pageControll.currentPageIndicatorTintColor = [UIColor redColor];
    pageControll.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControll = pageControll;
    self.pageControll.hidden = self.modelArray.count<=1;
}
//配置定时器

-(void)addTimer
{
    if (self.modelArray.count<=1) {
        return;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

-(NSIndexPath *)resetIndexPath
{
    //每调用一次这个方法，就会将collectionview滚回到最中间的那组的那个一样的图片
    
    NSIndexPath *curIndex = [[self.coll indexPathsForVisibleItems]firstObject];
    NSIndexPath * resetIndex = [NSIndexPath indexPathForItem:curIndex.item inSection:maxSection/2];
    [self.coll scrollToItemAtIndexPath:resetIndex atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    
    return resetIndex;
}

//定时器定时回调用的方法

-(void)nextPage
{
    if (self.modelArray.count==0) {
        return;
    }
    NSIndexPath *indexPath = [self resetIndexPath];
    NSInteger nextItem = indexPath.item + 1;
    NSInteger nextSection = indexPath.section;
    if (nextItem==self.modelArray.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *index = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self.coll scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}
-(void)setupColltionView

{
    //配置collectionview
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    UICollectionView *coll = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    //coll.frame = self.view.frame;
    [self.view addSubview:coll];
    coll.pagingEnabled = YES;
    coll.showsHorizontalScrollIndicator = NO;
    self.coll = coll;
    coll.dataSource = self;
    coll.delegate = self;
}


#pragma mark datasourcedelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return maxSection;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.modelArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    DTBigModelFrame *model = self.modelArray[indexPath.item];
    DTHeadCell *cell = [DTHeadCell headCellWithNibWithCollnectionView:collectionView andIndexPath:indexPath];
    cell.model = model;
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.bounds.size;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//调节组与组之间的间距为0

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


#pragma mark collectionDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   // NSLog(@"didSelectItemAtIndexPath");
    DTBigModelFrame *modelF = self.modelArray[indexPath.item];
    DTBigModel *model = modelF.model;

        DTHomeWebController *webVC = [[DTHomeWebController alloc]init];
    if ([model.dynamic_info isEqualToString:@"推广"]) {
       
        webVC.otherStr = model.target;
     
    }else
    {
    NSString *tepStr = [self stringWithSourceString:model.target];
     NSString *str = [NSString stringWithFormat:@"%@id=%@%@",topStr1,tepStr,topStr2];
        
        webVC.urlStr = str;
    }
    

    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
    
}


//视图出现 和消失的时候

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self addTimer];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self removeTimer];
}
//截取字符串
-(NSString *)stringWithSourceString:(NSString *)string
{
    NSRange range = [string rangeOfString:@"id"];
    NSString *str = [string substringFromIndex:range.location+range.length+1];
    
    NSLog(@"%@",str);
    return str;
}







//配置滚动
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    int num = (int)(scrollView.contentOffset.x/scrollView.width+0.5)%self.modelArray.count;
   // NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
   // NSLog(@"%d",num);
    self.pageControll.currentPage = num;
}
@end
