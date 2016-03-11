//
//  DTDetailFrame.h
//  DuiTang
//
//  Created by 苏威 on 16/3/9.
//  Copyright © 2016年 Monky. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTDetail;
@interface DTDetailFrame : NSObject
@property (nonatomic,strong)DTDetail *detail;
@property (assign ,nonatomic)CGRect iconFrame;




@property (assign ,nonatomic)CGRect smallIconFrame;
@property (assign ,nonatomic)CGRect nameFrame;
@property (assign ,nonatomic)CGRect timeFrame;
@property (assign ,nonatomic)CGRect littleContentFrame;
@property (assign ,nonatomic)CGRect littleImageFrame;

@property (assign ,nonatomic)CGRect contentFrame;

@property (assign ,nonatomic)CGRect msgFrame;


//专辑板块frame
@property (assign ,nonatomic)CGRect specialViewFrame;
@property (assign ,nonatomic)CGRect specialLabelFrame;
@property (assign ,nonatomic)CGRect specialScrollFrame;


@property (assign ,nonatomic)CGFloat maxHeight;

@end
