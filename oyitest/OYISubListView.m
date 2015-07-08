//
//  OYISubListView.m
//  engineering
//
//  Created by administrator on 14-12-23.
//  Copyright (c) 2014年 ruizhichen. All rights reserved.
//

#import "OYISubListView.h"

@implementation OYISubListView
{
    CGRect oyiframe;
    OYISubViewType subViewType;
}
@synthesize backView = _backView;
@synthesize subList = _subList;
@synthesize delegate = _delegate;
@synthesize datasource = _datasource;
@synthesize oyiSize = _oyiSize;

- (void)dealloc
{
    [_backView release];
    [_subList release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
            fortype:(OYISubViewType)type
{
    self = [super initWithFrame:frame];
    subViewType = type;
    if (self)
    {
        // Initialization code
        _oyiSize = frame;
        if (type == OYISubViewTypeTop)
        {
            oyiframe = CGRectMake(_oyiSize.origin.x,
                                  _oyiSize.origin.y,
                                  _oyiSize.size.width,
                                  0);
        }
        else if (type == OYISubViewTypeLeft)
        {
            oyiframe = CGRectMake(_oyiSize.origin.x,
                                  _oyiSize.origin.y,
                                  0,
                                  _oyiSize.size.height);
        }
        else if (type == OYISubViewTypeRight || type == OYISubViewTypeThirdMenu)
        {
            oyiframe = CGRectMake(_oyiSize.size.width,
                                  _oyiSize.origin.y,
                                  0,
                                  _oyiSize.size.height);
        }
        else if (type == OYISubViewTypeBottom)
        {
            oyiframe = CGRectMake(_oyiSize.origin.x,
                                  _oyiSize.size.height,
                                  _oyiSize.size.width,
                                  0);
        }
        self.frame = oyiframe;
        _subList = [[UITableView alloc] initWithFrame:oyiframe];
        if (type == OYISubViewTypeThirdMenu)
        {
            _subList.backgroundColor = [UIColor grayColor];
            
            UISwipeGestureRecognizer *recognizer;
            recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                   action:@selector(OyiShouqiList)];
            //设置滑动方向，下面以此类推
            [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
            [_subList addGestureRecognizer:recognizer];
            [recognizer release];
        }
        else
        {
            _subList.backgroundColor = [UIColor clearColor];
            
            UITapGestureRecognizer *singleTap =
            [[UITapGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(handleTap:)];
            singleTap.delegate = self;
            [self addGestureRecognizer:singleTap];
        }
        _subList.delegate = self;
        _subList.dataSource = self;
        [self addSubview:_subList];
    }
    return self;
}

- (void)OyiZhankaiList
{
    if (subViewType == OYISubViewTypeThirdMenu)
    {
        self.frame = _oyiSize;
    }
    else
    {
        self.frame = CGRectMake(0, 0, Screen_width, Screen_height);
    }
    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         _subList.frame = _oyiSize;
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (void)OyiShouqiList
{
    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         _subList.frame = oyiframe;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.0f
                                          animations:^{
                                              self.frame = CGRectMake(0, 0, Screen_width, 0);
                                              self.supOrder.scrollEnabled = YES;
                                          }];
                     }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"])
    {
        return NO;
    }
    return  YES;
}

- (void)handleTap:(id)sender
{
    [self OyiShouqiList];
}
/*===============================================================================
 模块功能说明：tableview处理
 =================================================================================*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_datasource numberOfButtons];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_datasource buttonAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate didClickCell:self atIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
