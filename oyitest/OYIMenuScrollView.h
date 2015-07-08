//
//  OYIMenuScrollView.h
//  oyitest
//
//  Created by administrator on 15-3-16.
//  Copyright (c) 2015年 ruizhichen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "oyiInitData.h"

@protocol OYIMenuScrollViewDelegate;
@protocol OYIMenuScrollViewDatasource;


@interface OYIMenuScrollView : UIView
<
UIScrollViewDelegate
>
{
    UIScrollView *_order;
    UIScrollView *_menu;
    
    id<OYIMenuScrollViewDelegate> _delegate;
    id<OYIMenuScrollViewDatasource> _datasource;
}

@property (nonatomic, retain) UIScrollView *order;
@property (nonatomic, retain) UIScrollView *menu;
@property (nonatomic, assign, setter = setDataource:)id<OYIMenuScrollViewDatasource>datasource;
@property (nonatomic, assign, setter = setDelegate:)id<OYIMenuScrollViewDelegate>delegate;

@property (nonatomic)CGRect supFrame;
@property (nonatomic, retain)UIColor *HelightColor;
@property (nonatomic, retain)UIColor *NomalColor;

@end

@protocol OYIMenuScrollViewDelegate <NSObject>
@optional



@end

@protocol OYIMenuScrollViewDatasource <NSObject>
@required

- (NSArray *)titleOfmenu;
- (UIView *)pageAtIndex:(NSInteger)index;

@end


