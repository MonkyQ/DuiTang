//
//  NSObject+AOP.h
//  AOP思想
//
//  Created by qianfeng on 15/12/23.
//  Copyright (c) 2015年 TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (AOP)


+(void)aop_changeMethod:(SEL)oldMethod newMenthod:(SEL)newMenthod;


@end
