
//
//  NSString+NSDate.m
//  UIbutton
//
//  Created by 毛宏鹏 on 15/9/1.
//  Copyright (c) 2015年 SQB. All rights reserved.
//

#import "NSString+NSDate.h"

@interface NSString_NSDate ()

@end

@implementation NSString_NSDate

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark ==字符串与日期相互转换
-(void)xianghuzhuanhuan
{
//    1、如何如何将一个字符串如“ 20110826134106”装化为任意的日期时间格式，下面列举两种类型：
    NSString* string = @"20110826134106";
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate* inputDate = [inputFormatter dateFromString:string];
    NSLog(@"date = %@", inputDate);
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
    NSString *str = [outputFormatter stringFromDate:inputDate];
    NSLog(@"testDate:%@", str);
//    两次打印的结果为：
//    date = 2011-08-26 05:41:06 +0000
//    testDate:2011年08月26日 13时41分06秒
    
//    说明：上面的时间是美国时间，下面的没有设置

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
