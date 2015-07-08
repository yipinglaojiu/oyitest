//
//  OYIMenuScrollView.m
//  oyitest
//
//  Created by administrator on 15-3-16.
//  Copyright (c) 2015年 ruizhichen. All rights reserved.
//

#import "OYIMenuScrollView.h"

@implementation OYIMenuScrollView
{
    NSMutableArray *oyiMenuBtn;
    NSArray *oyiMenu;
    CGFloat width;
}

@synthesize supFrame = _supFrame;
@synthesize HelightColor = _HelightColor;
@synthesize NomalColor = _NomalColor;

- (OYIMenuScrollView *)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _supFrame = frame;
    }
    
    return self;
}

- (void)setDataource:(id<OYIMenuScrollViewDatasource>)datasource
{
    _datasource = datasource;
    [self reloadData];
}

- (void)reloadData
{
    oyiMenu = [_datasource titleOfmenu];
    if (oyiMenu.count == 0) {
        return;
    }
    width = self.frame.size.width / 5;
    [self OyiCreateMenu];
    [self OyiCreateOrder];
}

- (void)OyiCreateMenu
{
    self.menu = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.supFrame.origin.y, self.supFrame.size.width, 40)];
    self.menu.tag = 200;
    oyiMenuBtn = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < oyiMenu.count; i++)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(width * i, 0, width, 40)];
        [btn setTitle:oyiMenu[i]
             forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor whiteColor]
                  forState:(UIControlStateNormal)];
        if (i == 0)
        {
            btn.backgroundColor = _HelightColor;
        }
        else
        {
            btn.backgroundColor = _NomalColor;
        }
        btn.tag = i;
        [btn addTarget:self
                action:@selector(oyiDidSelectedMenu:)
      forControlEvents:(UIControlEventTouchUpInside)];
        [self.menu addSubview:btn];
        [oyiMenuBtn addObject:btn];
    }
    
    self.menu.contentSize = CGSizeMake(width * oyiMenu.count, 0);
    self.menu.backgroundColor = _NomalColor;
    
    [self addSubview:self.menu];
}

- (void)OyiCreateOrder
{
    self.order = [[UIScrollView alloc] init];
    self.order.frame = CGRectMake(0, self.supFrame.origin.y + 40, Screen_width, Screen_width - StatusBar_height);
    self.order.pagingEnabled=YES;
    self.order.delegate=self;
    self.order.showsHorizontalScrollIndicator=NO;
    self.order.showsVerticalScrollIndicator=NO;
    self.order.tag = 100;
    
    for (int i=0; i<oyiMenu.count; i++)
    {
        [self.order addSubview:[_datasource pageAtIndex:i]];
    }
    [self.order setContentSize:CGSizeMake(Screen_width * oyiMenu.count, 0)];
    //    [self.order setContentOffset:CGPointMake(0, 0) animated:NO];
    
    [self addSubview:self.order];
}

- (IBAction)oyiDidSelectedMenu:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    [self.order setContentOffset:CGPointMake(Screen_width * btn.tag, 0) animated:NO];
    [self oyiMenuDidSelected:btn.tag];
}

- (void)oyiMenuDidSelected:(NSInteger)index
{
    for (UIButton *btn in oyiMenuBtn)
    {
        if (btn.tag == index)
        {
            btn.backgroundColor = _HelightColor;
        }
        else
        {
            btn.backgroundColor = _NomalColor;
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    NSInteger page = ((NSInteger)point.x + Screen_width/2) / Screen_width;
    [self oyiMenuDidSelected:page];
    [self oyiMoveMenuBtn:page scrollview:self.menu];
}

- (void)oyiMoveMenuBtn:(NSInteger)index scrollview:(UIScrollView *)scrollview;
{
    NSInteger x = width * index;
    CGPoint point = scrollview.contentOffset;
    
    if (point.x + Screen_width < x + width)
    {
        [scrollview setContentOffset:CGPointMake(x - Screen_width + width, 0) animated:NO];
    }
    else if (x < point.x)
    {
        [scrollview setContentOffset:CGPointMake(x, 0) animated:NO];
    }
}

@end
