//
//  OYICycleScrollDelegate.h
//  oyitest
//
//  Created by administrator on 15-3-11.
//  Copyright (c) 2015年 ruizhichen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XLCycleScrollView.h"
#import "oyiInitData.h"

@interface OYICycleScrollDelegate : NSObject
<
XLCycleScrollViewDatasource
,XLCycleScrollViewDelegate
>

@property (retain, nonatomic) NSArray *oyiDatasource;

- (id)initWithFrame:(CGRect)frame
            andType:(OYIViewsType)type;

@end
