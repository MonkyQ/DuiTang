//
//  DTDiscuss.m
//  DuiTang
//
//  Created by 苏威 on 16/3/10.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTDiscuss.h"
#import "MJExtension.h"
#import "DTPhoto.h"

@implementation DTDiscuss
+ (NSDictionary *)replacedKeyFromPropertyName

{
    
    return @{@"cid" : @"id"};
    
}
+(NSDictionary *)objectClassInArray
{
    return @{@"photos" : [DTPhoto class]};
}
@end
