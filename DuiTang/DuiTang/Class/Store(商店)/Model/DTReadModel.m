//
//  DTReadModel.m
//  DuiTang
//
//  Created by Dylan on 3/7/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import "DTReadModel.h"
@implementation Root
@end

@implementation RootData
@end



@implementation DTReadModel
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"ID"}];
}
@end

@implementation DTReadCoverModel
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"ID"}];
}
@end