//
//  DTViewController.h
//  DuiTang
//
//  Created by Monky on 16/3/7.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTViewController : UITabBarController
{
    EMConnectionState _connectionState;
}

- (void)jumpToChatList;

- (void)setupUntreatedApplyCount;

- (void)setupUnreadMessageCount;

- (void)networkChanged:(EMConnectionState)connectionState;

- (void)didReceiveLocalNotification:(UILocalNotification *)notification;

- (void)playSoundAndVibration;

- (void)showNotificationWithMessage:(EMMessage *)message;
@end
