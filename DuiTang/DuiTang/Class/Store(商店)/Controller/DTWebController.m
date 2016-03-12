//
//  DTWebController.m
//  DuiTang
//
//  Created by Dylan on 3/7/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import "DTWebController.h"
#import "DTWebModel.h"

@interface DTWebController ()
@property (nonatomic,strong)UIWebView * webView;
@property (nonatomic,strong)NSNumber * modId;
@property (nonatomic,strong)DTWebModel * mod;

@end

@implementation DTWebController
+(instancetype)dtWebControllerWithID:(NSNumber *)ID
{
    DTWebController * web=[[DTWebController alloc]init];
    web.modId=ID;
    return web;
}
+(instancetype)dtWebControllerWithhtmlString:(NSString *)htmlString
{
    DTWebController * web=[[DTWebController alloc]init];
    [web.webView loadHTMLString:htmlString baseURL:nil];
    return web;
}
- (void)viewDidLoad
{
    
    [self downLoadData];
    
    self.webView=[[UIWebView alloc]init];
    [self.view addSubview:self.webView];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.top.equalTo(NAVH+20);
         
         //修改下面有黑边的bug
        make.bottom.equalTo(@0);
    }];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)downLoadData
{
    //下载
    NSInteger ID=self.modId.integerValue;
    NSString * path1=@"http://203.80.144.212/napi/topic/detail/?platform_name=iPhone%20lOS&__domain=www.duitang.com&include_fields=share_links&app_version=6.0.1%20rv%3A153547&device_platform=iPhone6%2C2&";
    NSString * path2=[NSString stringWithFormat:@"topic_id=%ld",ID];
    NSString * path3=@"&app_code=gandalf&locale=zh_CN&platform_version=9.2.1&screen_height=568&device_name=Unknown%20iPhone&screen_width=320&__dtac=%257B%2522_r%2522%253A%2520%2522276775%2522%257D";
    NSString * path=[NSString stringWithFormat:@"%@%@%@",path1,path2,path3];
    [DTNetHelper getDataWithParam:nil andPath:path andComplete:^(BOOL success, id result)
    {
        if (success)
        {
            NSLog(@"成功");
            NSError * error;
            DTWebModel * mod =[[DTWebModel alloc]initWithData:result error:&error];
            if (error)
            {
                NSLog(@"web解析错误%@",error);
                return;
            }
            self.mod=mod;
            DTWebData * data=mod.data;
            NSString * urlString= data.article_content;
            [self.webView loadHTMLString:urlString baseURL:nil];
        }
        else
        {
            NSLog(@"失败");
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
