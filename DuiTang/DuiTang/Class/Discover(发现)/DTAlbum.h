//
//  DTAlbum.h
//  DuiTang
//
//  Created by Monky on 16/3/11.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTContentModel.h"


@interface DTAlbum : UIView
@property (nonatomic,assign)CGFloat Height;
@property (nonatomic,assign)CGFloat Width;
- (void)configureModel:(Content *)model;
@end
