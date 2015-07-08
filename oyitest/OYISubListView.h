//
//  OYISubListView.h
//  engineering
//
//  Created by administrator on 14-12-23.
//  Copyright (c) 2014年 ruizhichen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "oyiInitData.h"

@protocol OYISubListViewDelegate;
@protocol OYISubListViewDatasource;

@interface OYISubListView : UIView<
UITableViewDataSource
,UITableViewDelegate
,UIGestureRecognizerDelegate
>
{
    id<OYISubListViewDelegate> _delegate;
    id<OYISubListViewDatasource> _datasource;
    
    UIView *_backView;
    UITableView *_subList;
    NSMutableArray *_btnList;
}

@property (nonatomic, readonly) UIView *backView;
@property (nonatomic, readonly) UITableView *subList;
@property (nonatomic) CGRect oyiSize;
@property (nonatomic,assign,setter = setDataource:) id<OYISubListViewDatasource> datasource;
@property (nonatomic,assign,setter = setDelegate:) id<OYISubListViewDelegate> delegate;
@property (nonatomic, strong) UIScrollView *supOrder;

- (void)OyiZhankaiList;
- (void)OyiShouqiList;
- (id)initWithFrame:(CGRect)frame
            fortype:(OYISubViewType)type;

@end

@protocol OYISubListViewDelegate <NSObject>

@optional
- (void)didClickCell:(OYISubListView *)csView
             atIndex:(NSInteger)index;

@end

@protocol OYISubListViewDatasource <NSObject>

@required
- (NSInteger)numberOfButtons;
- (UITableViewCell *)buttonAtIndex:(NSInteger)index;

@end
