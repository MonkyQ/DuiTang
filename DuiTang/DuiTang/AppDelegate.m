//
//  AppDelegate.m
//  DuiTang
//
//  Created by Monky on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "AppDelegate.h"
#import "DTViewController.h"
#import "AppDelegate+EaseMob.h"
#import "SSApplicationInfo.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1.创建Window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //2.添加代码
    DTViewController *DTVC = [[DTViewController alloc]init];
    self.window.rootViewController = DTVC;
    //3.将window显示出来
    [self.window makeKeyAndVisible];

    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        [self setUpEaseMob:launchOptions and:application];
    });
    
    //登陆
    NSString * userName=[[SSApplicationInfo clipboardContent]substringToIndex:5];
    userName = [NSString stringWithFormat:@"user%@",userName];
    [self loginEaseMob:userName];
    
    
    return YES;
}
//登陆
- (void)loginEaseMob:(NSString *)userID
{
    NSLog(@"%@",userID);
    NSString * psw= [NSString stringWithFormat:@"p%@",userID];
    EMError *error = [[EMClient sharedClient] loginWithUsername:userID password:psw];
    if (!error)
    {
        NSLog(@"登陆成功");
        [[EMClient sharedClient].options setIsAutoLogin:NO];
    }
    else
    {//6eh4351041
        NSLog(@"%@",error);
        EMError * error1 = [[EMClient sharedClient] registerWithUsername:userID password:psw];
        EMError *error2 = [[EMClient sharedClient] loginWithUsername:userID password:psw];
        if (!error2)
        {
            NSLog(@"登陆成功");
            //[[EMClient sharedClient].options setIsAutoLogin:YES];
        }
        else
        {
            NSLog(@"%@",error1);
        }
    }
    //自动加入群[[EMClient sharedClient].groupManager addOccupants:@[@"user1"] toGroup:@"groupId" welcomeMessage:@"message" error:&error];
    //171198851175154144
    //EMError * error;
    [[EMClient sharedClient].groupManager joinPublicGroup:@"171204808638726604" error:&error];
}

- (void)setUpEaseMob:(NSDictionary *)launchOptions and:application {
    
    EMOptions *options = [EMOptions optionsWithAppkey:@"tsnumi#tsnumi"];
    options.apnsCertName = @"development";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    [self easemobApplication:application didFinishLaunchingWithOptions:launchOptions
                      appkey:@"tsnumi#tsnumi"
                apnsCertName:@"development"
                 otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES]}];
    
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
