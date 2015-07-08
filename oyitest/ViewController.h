//
//  ViewController.h
//  oyitest
//
//  Created by administrator on 15-3-11.
//  Copyright (c) 2015年 ruizhichen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLCycleScrollView.h"
#import "OYICycleScrollDelegate.h"
#import "OYIMenuScrollView.h"
#import "OYISubListView.h"

@interface ViewController : UIViewController
<
UITableViewDataSource
,UITableViewDelegate
,OYIMenuScrollViewDatasource
,OYIMenuScrollViewDelegate
,OYISubListViewDatasource
,OYISubListViewDelegate
>

@property (nonatomic, retain) XLCycleScrollView *oyiCycleScrollView;
@property (nonatomic, retain) OYICycleScrollDelegate *oyiCSDelegate;
@property (nonatomic, retain) OYIMenuScrollView *menu;
@property (nonatomic, retain) OYISubListView *subList;

@end

