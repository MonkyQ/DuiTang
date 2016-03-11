//
//  DTDetailViewController.m
//  DuiTang
//
//  Created by 苏威 on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDetailViewController.h"
#import "DTNetHelper.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "DTDetailFrame.h"
#import "DTDetailHeadView.h"
#import "DTRelated.h"



#import "DTDetailSpecialView.h"


#import "UIImageView+webcache.h"

#import "DTDetail.h"

@interface DTDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak)UIScrollView *scrollView;
@property (nonatomic ,strong)DTDetailFrame *detailF;
@end

@implementation DTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    [self loadData];
   
}
-(void)setupSubviews
{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    scrollView.frame = (CGRect){{0,64,},self.view.bounds.size };
    
    DTDetailHeadView *headView = [[DTDetailHeadView alloc]init];
    headView.modelF = self.detailF;

    [self.scrollView addSubview:headView];
    
    //专辑视图
    DTDetailSpecialView *specialView = [[DTDetailSpecialView alloc]init];
    [self.scrollView addSubview:specialView];
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    specialView.model = self.detailF;

    
    specialView.backgroundColor = DTGlobalBg;
    
    
    CGFloat maxContentSize = self.detailF.maxHeight;
    if (maxContentSize<= mainScreenheight) {
        maxContentSize = mainScreenheight+homePedding*2;
    }else {
        maxContentSize = maxContentSize +(3*homePedding);
    }
    self.scrollView.contentSize = CGSizeMake(0, maxContentSize);
    
    
}

-(void)loadData
{
    [DTNetHelper getDataWithParam:nil andPath:self.urlStr andComplete:^(BOOL success, id result) {
        if (success) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dataDict = dict[@"data"];
            //NSLog(@"%@",dataDict);
            DTDetail *detail = [DTDetail mj_objectWithKeyValues:dataDict];
            DTDetailFrame *detailF = [[DTDetailFrame alloc]init];
            detailF.detail = detail;
            self.detailF = detailF;
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setupSubviews];
            });
        }
        
    }];
    
}

#pragma mark UITableViewDataSource  UITableViewDelegate



@end
