//
//  DTViewController.m
//  DuiTang
//
//  Created by Monky on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTViewController.h"
#import "DTHomeViewController.h"
#import "DTDiscoverViewController.h"
#import "DTStoreViewController.h"
#import "DTMineViewController.h"

@interface DTViewController ()

@end

@implementation DTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewController];
}

- (void)setupViewController
{
    DTHomeViewController *home = [[DTHomeViewController alloc]init];
    [self addChildVC:home title:@"首页" image:@"tab_icon_home" selectedImage:@"tab_icon_home_highlight"];
    
    DTDiscoverViewController *group = [[DTDiscoverViewController alloc]init];
    [self addChildVC:group title:@"发现" image:@"tab_icon_explore" selectedImage:@"tab_icon_explore_highlight"];
    
    DTStoreViewController *job = [[DTStoreViewController alloc]init];
    [self addChildVC:job title:@"阅读" image:@"tab_icon_store" selectedImage:@"tab_icon_store_highlight"];
    
    DTMineViewController *mine = [[DTMineViewController alloc]init];
    [self addChildVC:mine title:@"我" image:@"tab_icon_me" selectedImage:@"tab_icon_me_highlight"];
    
}


- (void)addChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置子控制器标题
    childVC.title = title;
    //设置子控制器图片
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置文字样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
}
@end
