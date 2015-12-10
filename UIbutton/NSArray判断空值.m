//
//  NSArray判断空值.m
//  UIbutton
//
//  Created by 毛宏鹏 on 15/9/10.
//  Copyright (c) 2015年 SQB. All rights reserved.
//

#import "NSArray判断空值.h"

@interface NSArray____ ()

@end

@implementation NSArray____

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
#pragma mark--判断数组不为空
-(void)nsarrayIsEmpty
{
    NSArray *_AdData = [NSArray arrayWithObjects:@"", nil];
    
    if (_AdData != nil && ![_AdData isKindOfClass:[NSNull class]] && _AdData.count != 0)
    {
        
    }else
    {
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
