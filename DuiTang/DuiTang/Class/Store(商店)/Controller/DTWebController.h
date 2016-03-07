//
//  DTWebController.h
//  DuiTang
//
//  Created by Dylan on 3/7/16.
//  Copyright © 2016 Monky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTReadModel.h"
@interface DTWebController : UIViewController

+(instancetype)dtWebControllerWithhtmlString:(NSString *)htmlString;

+(instancetype)dtWebControllerWithID:(NSNumber *)ID;

@end
