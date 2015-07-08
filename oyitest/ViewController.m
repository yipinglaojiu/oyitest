//
//  ViewController.m
//  oyitest
//
//  Created by administrator on 15-3-11.
//  Copyright (c) 2015年 ruizhichen. All rights reserved.
//

#import "ViewController.h"
#import "oyiInitData.h"

@interface ViewController ()
{
    NSArray *oyiDataSource;
    NSArray *oyiMenu;
    NSMutableArray *oyiMenuBtn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    oyiDataSource = [[NSArray alloc] initWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"第一",@"data", nil], [NSDictionary dictionaryWithObjectsAndKeys:@"第二",@"data", nil], [NSDictionary dictionaryWithObjectsAndKeys:@"第三",@"data", nil], [NSDictionary dictionaryWithObjectsAndKeys:@"第四",@"data", nil], nil];
    
    oyiMenu = [[NSArray alloc] initWithObjects:@"标题1",@"标题2",@"标题3",@"标题4",@"标题5",@"标题6",@"标题7", nil];
    
//    [self OyiCreateCycleScrollView];
    [self OyiCreateMenu];
    [self OyiCreateSubList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*===============================================================================
 模块功能说明：<# #>
 =================================================================================*/

- (void)OyiCreateCycleScrollView
{
    self.oyiCSDelegate = [[OYICycleScrollDelegate alloc] initWithFrame:CGRectMake(0, 0, Screen_width, IMG_HEIGHT)
                                                               andType:(OYIViewsTypeLab)];
    self.oyiCSDelegate.oyiDatasource = oyiDataSource;
    
    self.oyiCycleScrollView = [[XLCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, IMG_HEIGHT)];
    self.oyiCycleScrollView.delegate = self.oyiCSDelegate;
    self.oyiCycleScrollView.datasource = self.oyiCSDelegate;
    [self.view addSubview:self.oyiCycleScrollView];
}

- (void)OyiCreateSubList
{
    _subList = [[OYISubListView alloc] initWithFrame:CGRectMake(50, 60, Screen_width - 50, Screen_height - 20) fortype:(OYISubViewTypeThirdMenu)];
    _subList.delegate = self;
    _subList.datasource = self;
    _subList.supOrder = self.menu.order;
    
    [self.view addSubview:_subList];
}

- (NSInteger)numberOfButtons
{
    return oyiMenu.count;
}

- (UITableViewCell *)buttonAtIndex:(NSInteger)index
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = oyiMenu[index];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    //    cell.backgroundColor = [UIColor colorWithRed:244.0/255 green:122.0/255 blue:15.0/255 alpha:1.0f];
    cell.backgroundColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.7f];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

- (void)didClickCell:(OYISubListView *)csView
             atIndex:(NSInteger)index
{
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:nil
                               message:oyiMenu[index]
                              delegate:self
                     cancelButtonTitle:@"ok"
                     otherButtonTitles:nil, nil];
    [alert show];
}

- (void)OyiCreateMenu
{
    self.menu = [[OYIMenuScrollView alloc] initWithFrame:CGRectMake(0, 10, Screen_width, Screen_height)];
    self.menu.HelightColor = [UIColor redColor];
    self.menu.NomalColor = [UIColor lightGrayColor];
    self.menu.datasource = self;
    
    [self.view addSubview:self.menu];
}

- (NSArray *)titleOfmenu
{
    return oyiMenu;
}

- (UIView *)pageAtIndex:(NSInteger)index
{
    UITableView *order = [[UITableView alloc] initWithFrame:CGRectMake(Screen_width * index, 0, Screen_height, Screen_height - 20)];
    order.tag = index;
    order.delegate = self;
    order.dataSource = self;
    
    return order;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%lu",(long)tableView.tag];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_subList.subList.frame.size.width <= 0)
    {
        [_subList OyiZhankaiList];
        self.menu.order.scrollEnabled = NO;
    }
    [_subList.subList reloadData];
}

@end
