//
//  FirstViewController.m
//  UIbutton
//
//  Created by HuaMen on 15-2-10.
//  Copyright (c) 2015年 SQB. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"错误记录＝＝错误记录＝＝错误记录";
    // Do any additional setup after loading the view from its nib.
}

-(void)addJiLuViewcCUO
{
    NSArray *_loanArry = [NSArray arrayWithObjects:@"11",@"22",@"33",@"44",@"55",@"66",@"77", nil];
    UIView *jiluView = [[UIView alloc] initWithFrame:CGRectMake(10, 20+64, 300, _loanArry.count*44)];
    jiluView.layer.borderWidth = 0.5;
    jiluView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    jiluView.layer.cornerRadius = 5;
    jiluView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:jiluView];
    //todo todo1  很奇怪的现象 如果没有 label11 接下来无法正常显示
        UILabel *label11 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    //todo todo2
    for (int i; i<_loanArry.count; i++) {
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 44*i, 150, 44)];
        label2.textAlignment=NSTextAlignmentLeft;
        label2.text = [[_loanArry objectAtIndex:i] objectForKey:@"key"];
        label2.font=[UIFont fontWithName:@"Arial" size:14];
        label2.textColor = [UIColor grayColor];
        [jiluView addSubview:label2];
        
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(160, 44*i, 150, 44)];
        label3.textAlignment=NSTextAlignmentLeft;
        //此处必须用类型转换 否则会崩溃 因为value 有多种类型，
        label3.text = [NSString stringWithFormat:@"%@",[[_loanArry objectAtIndex:i] objectForKey:@"value"]];
        label3.font=[UIFont fontWithName:@"Arial" size:14];
        [jiluView addSubview:label3];
        
    }
    
}

-(void)addJiLuViewcDUI
{
    NSArray *_loanArry = [NSArray arrayWithObjects:@"11",@"22",@"33",@"44",@"55",@"66",@"77", nil];
    UIView *jiluView = [[UIView alloc] initWithFrame:CGRectMake(10, 20+64, 300, _loanArry.count*44)];
    jiluView.layer.borderWidth = 0.5;
    jiluView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    jiluView.layer.cornerRadius = 5;
    jiluView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:jiluView];
    //todo todo1  很奇怪的现象 如果没有 label11 接下来无法正常显示
//    UILabel *label11 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    //todo todo2
    for (int i=0; i<_loanArry.count; i++) {
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 44*i, 150, 44)];
        label2.textAlignment=NSTextAlignmentLeft;
        label2.text = [[_loanArry objectAtIndex:i] objectForKey:@"key"];
        label2.font=[UIFont fontWithName:@"Arial" size:14];
        label2.textColor = [UIColor grayColor];
        [jiluView addSubview:label2];
        
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(160, 44*i, 150, 44)];
        label3.textAlignment=NSTextAlignmentLeft;
        //此处必须用类型转换 否则会崩溃 因为value 有多种类型，
        label3.text = [NSString stringWithFormat:@"%@",[[_loanArry objectAtIndex:i] objectForKey:@"value"]];
        label3.font=[UIFont fontWithName:@"Arial" size:14];
        [jiluView addSubview:label3];
        
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
