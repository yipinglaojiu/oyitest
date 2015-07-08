//
//  OYIWarningView.h
//  oyitest
//
//  Created by administrator on 15-3-11.
//  Copyright (c) 2015年 ruizhichen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "oyiInitData.h"

@interface OYIWarningView : NSObject

+(void)OyiWarningWithMessage:(NSString *)message
                     forType:(OYIWarnType)type;

@end
