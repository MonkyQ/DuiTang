//
//  DTContentModel.m
//  DuiTang
//
//  Created by Monky on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import "DTContentModel.h"

@implementation DTContentModel

@end

@implementation Content

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"Did"}];
}

@end

@implementation ContentPhoto


@end

@implementation ContentSender

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"Cid"}];
}
@end

@implementation ContentAlbum

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"Bid"}];
}
@end

@implementation Contentrelated

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"Aid"}];
}
@end

@implementation ContentrelatedUser

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"AiD"}];
}

@end
