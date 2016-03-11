//
//  DTHomeWebController.m
//  DuiTang
#import "DTNetHelper.h"
//
//  Created by 苏威 on 16/3/8.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTHomeWebController.h"

@interface DTHomeWebController ()
@property (nonatomic ,weak)UIWebView *web;
@end

@implementation DTHomeWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupWebview];
    [self loadData];
    
    // Do any additional setup after loading the view.
}


-(void)dealloc
{
   
}

-(void)loadData
{
    if (self.otherStr==nil) {
        
        [DTNetHelper getDataWithParam:nil andPath:self.urlStr andComplete:^(BOOL success, id result) {
            if (success) {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
                NSDictionary *dataDict = dict[@"data"];
                NSString *htmlStr = dataDict[@"article_content"];
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self.web loadHTMLString:htmlStr baseURL:nil];
                });
                
            }
            
        }];

        
    }else
    {
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.otherStr]];
        [self.web loadRequest:request];
    }
    
}
//配置webview
-(void)setupWebview
{
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:web];
    self.web = web;
   
    
    
    
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
