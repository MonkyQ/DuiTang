//
//  DTWebModel.m
//  DuiTang
//
//  Created by Dylan on 3/7/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import "DTWebModel.h"

@implementation DTWebModel

@end


@implementation DTWebData
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"ID"}];
}
@end
