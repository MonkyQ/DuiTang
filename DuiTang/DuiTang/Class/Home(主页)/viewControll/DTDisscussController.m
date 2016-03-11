//
//  DTDisscussController.m
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDisscussController.h"
#import "DTNetHelper.h"
#import "DTDiscuss.h"
#import "DTDiscussFrame.h"
#import "MJExtension.h"
#import "DTComment.h"
#import "DTCommentFrame.h"


#import "DTHomeCommentCell.h"
#import "DTDisHeadview.h"

@interface DTDisscussController ()<UITableViewDataSource ,UITableViewDelegate>
@property (nonatomic ,weak)UITableView *tableView;
@property (nonatomic ,strong)DTDiscussFrame *discussF;
@property (nonatomic ,strong)NSMutableArray *commentFarray;
@property (nonatomic ,strong)NSMutableArray *sectionModelarray;
@end

@implementation DTDisscussController
-(NSMutableArray *)sectionModelarray{
    if (_sectionModelarray==nil) {
        _sectionModelarray=[NSMutableArray array];
    }
    return _sectionModelarray;
}

-(NSMutableArray *)commentFarray{
    if (_commentFarray==nil) {
        _commentFarray=[NSMutableArray array];
    }
    return _commentFarray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DTGlobalBg;
    [self loadData];
    [self setupTableView];
  
    
}

-(void)loadData
{
    //请求头部数据
    [DTNetHelper getDataWithParam:nil andPath:self.disString andComplete:^(BOOL success, id result) {
        
        if (success) {
            //NSLog(@"%@",self.disString);
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dataDict = dict[@"data"];
            
            DTDiscuss *discuss = [DTDiscuss mj_objectWithKeyValues:dataDict];
            DTDiscussFrame *discussF = [[DTDiscussFrame alloc]init];
            discussF.discuss = discuss;
            self.discussF = discussF;
           
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self setupHeadView];
                
                [self.tableView reloadData];
            
            });
            
        }
    }];
    
    //请求评论数据
    [self.commentFarray removeAllObjects];
        [self.sectionModelarray removeAllObjects];
    [DTNetHelper getDataWithParam:nil andPath:self.discussString andComplete:^(BOOL success, id result) {
        
        if (success) {
            //NSLog(@"%@",self.disString);
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dataDict = dict[@"data"];
          NSArray *listArray = dataDict[@"object_list"];
            
            for (NSDictionary *comDict in listArray) {
                DTComment *comment = [DTComment mj_objectWithKeyValues:comDict];
                DTCommentFrame *commentF = [[DTCommentFrame alloc]init];
                commentF.comment =comment;
                [self.commentFarray addObject:commentF];
            }
            if (self.commentFarray.count >=3) {
                NSMutableArray * arr = [NSMutableArray array];
                for (int i =0; i<3; i++) {
                    DTCommentFrame *comF = self.commentFarray[i];
                    [arr addObject:comF];
                }
                
                [self.commentFarray removeObjectsInArray:arr];
                [self.sectionModelarray addObject:arr];
                
                [self.sectionModelarray addObject:self.commentFarray];
              
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
  
                [self.tableView reloadData];
                
            });
            
        }
    }];


}

-(void)setupTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.y = 64;
    tableView.size = self.view.size;
    [self.view addSubview:tableView];
    
    //    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(self.view);
    //    }];
    tableView.backgroundColor = DTGlobalBg;
    tableView.autoresizingMask = UIViewAutoresizingNone;
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.tableView = tableView;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self setupHeadView];
    
}
-(void)setupHeadView
{
    DTDisHeadview *headView = [[DTDisHeadview alloc]init];
    headView.backgroundColor = [UIColor whiteColor];
    headView.height = self.discussF.maxHight;
    headView.discussF = self.discussF;
    self.tableView.tableHeaderView = headView;
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionModelarray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = self.sectionModelarray[section];
   
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTCommentFrame *commentF = self.commentFarray[indexPath.row];
  
    DTHomeCommentCell *cell = [DTHomeCommentCell homeCommentCellWithTableView:tableView];
    cell.commentF = commentF;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTCommentFrame *commentF = self.commentFarray[indexPath.row];
    return commentF.maxHight;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"热门评论";
    }else
    {
        return @"全部评论";
    }
    
}
@end
