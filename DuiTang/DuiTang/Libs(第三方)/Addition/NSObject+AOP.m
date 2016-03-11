//
//  NSObject+AOP.m
//  AOP思想
//
//  Created by qianfeng on 15/12/23.
//  Copyright (c) 2015年 TS. All rights reserved.
//

#import "NSObject+AOP.h"

@implementation NSObject (AOP)
+(void)aop_changeMethod:(SEL)oldMethod newMenthod:(SEL)newMenthod
{
    Method myoldMethod =class_getInstanceMethod([self class], oldMethod);
    Method mynewMentod =class_getInstanceMethod([self class], newMenthod);
    method_exchangeImplementations(myoldMethod, mynewMentod);
}

@end
