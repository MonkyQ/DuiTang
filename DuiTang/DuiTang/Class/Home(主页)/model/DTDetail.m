//
//  DTDetail.m
//  DuiTang
//
//  Created by 苏威 on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDetail.h"
#import "MJExtension.h"
#import "DTRelated.h"
@implementation DTDetail
+ (NSDictionary *)replacedKeyFromPropertyName

{
    
    return @{@"cid" : @"id"};
    
}
+(NSDictionary *)objectClassInArray
{
    return @{@"related_albums" : [DTRelated class]};
}
@end
