//
//  OYICycleScrollDelegate.m
//  oyitest
//
//  Created by administrator on 15-3-11.
//  Copyright (c) 2015年 ruizhichen. All rights reserved.
//

#import "OYICycleScrollDelegate.h"
#import "oyiInitData.h"

@implementation OYICycleScrollDelegate
{
    OYIViewsType viewsType;
    CGRect oyiRect;
}
@synthesize oyiDatasource = _oyiDatasource;

- (id)initWithFrame:(CGRect)frame
            andType:(OYIViewsType)type
{
    self = [super init];
    if (self)
    {
        viewsType = type;
        oyiRect = frame;
    }
    return self;
}

- (NSInteger)numberOfPages
{
    return self.oyiDatasource.count;
}

- (UIView *)pageAtIndex:(NSInteger)index
{
//    CGRect rect = CGRectMake(0, 0, Screen_width, IMG_HEIGHT);
    
    if (viewsType == OYIViewsTypeLocal)
    {
        UIImageView *oyiImgView = [[UIImageView alloc] initWithFrame:oyiRect];
        oyiImgView.image = [UIImage imageNamed:self.oyiDatasource[index][@"data"]];
        
        return oyiImgView;
    }
    else if (viewsType == OYIViewsTypeRul)
    {
        UIImageView *oyiImgView = [[UIImageView alloc] initWithFrame:oyiRect];
        NSString *url = [NSString stringWithFormat:@"%@%@",mainUrl,self.oyiDatasource[index][@"data"]];
//        oyiad = [[[oyiAsynchDownload alloc] init] autorelease];
//        [oyiad AdImg:url
//           imageView:oyiImgView];
        
        return oyiImgView;
    }
    else if ( viewsType == OYIViewsTypeLab)
    {
        UILabel *oyiImgView = [[UILabel alloc] initWithFrame:oyiRect];
        oyiImgView.text = [NSString stringWithFormat:@"%@",self.oyiDatasource[index][@"data"]];
        oyiImgView.backgroundColor = [UIColor grayColor];
        
        return oyiImgView;
    }
    
    return nil;
}

- (void)didClickPage:(XLCycleScrollView *)csView atIndex:(NSInteger)index
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"string"
                                                   delegate:self
                                          cancelButtonTitle:@"ok"
                                          otherButtonTitles:nil];
    [alert show];
}


@end
