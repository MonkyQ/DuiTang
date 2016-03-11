//
//  UINavigationController+AOP.m
//  DuiTang
//
//  Created by Dylan on 3/8/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import "UINavigationController+AOP.h"
#import "ChatDemoHelper.h"
@implementation UINavigationController (AOP)
+(void)load
{
    [UINavigationController aop_changeMethod:@selector(pushViewController:animated:) newMenthod:@selector(aop_pushViewController:animated:)];
    NSLog(@"load");
}

-(void)aop_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //1.在执行真正的push之前添加一些其他逻辑
    NSLog(@"push 执行之前执行一些列代码");
    
    if ([viewController.class isSubclassOfClass:ConversationListController.class])
    {
        NSLog(@"这是最后一个页面");
    }
    //2.在原逻辑执行之后,添加一些逻辑代码
    [self aop_pushViewController:viewController animated:animated];
    NSLog(@"push 执行之后执行一些列代码");
}

@end
