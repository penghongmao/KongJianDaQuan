//
//  ViewController.m
//  UIbutton
//
//  Created by HuaMen on 15-1-28.
//  Copyright (c) 2015年 SQB. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "MySecondView.h"
#import "FirstViewController.h"

#pragma mark-  宏定义 颜色 RGBA
#define RGBA(r,g,b,a)               [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

//打包时 统一隐藏  NSLog
#ifdef DEBUG // 调试
#define MyLog(...) NSLog(__VA_ARGS__)
#else // 发布打包
#define MyLog(...)
#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//键盘消失的手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];

    // Do any additional setup after loading the view, typically from a nib.
//    [self UIView];
//    UINavigationBar *navigation = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    navigation.backgroundColor = [UIColor yellowColor];
//    
//    [self.view addSubview:navigation];
    
    self.myScrollView.frame = self.view.frame;
    
    self.myScrollView.contentSize = CGSizeMake(320, 1000);
 
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 700, 320, 100)];
    myLabel.text = @"ceshi ceshi cesahi ceshi ";

    [self.myScrollView addSubview:myLabel];
    
    
    
}

#pragma mark-  UIButton
- (void)button
{
    UIButton *FabuBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [FabuBtn setBackgroundImage:[UIImage imageNamed:@"凸起按钮"] forState:UIControlStateNormal];
    [FabuBtn setTitle:@"我要发布" forState:UIControlStateNormal];
    FabuBtn.frame=CGRectMake(100, self.view.bounds.size.height-110, 120, 30);
    [FabuBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [FabuBtn setHidden:YES];
    FabuBtn.backgroundColor = RGBA(255, 215, 0, 1);
    
    FabuBtn.layer.cornerRadius = 5;
    FabuBtn.layer.masksToBounds = YES;

    [FabuBtn.titleLabel setTextAlignment:NSTextAlignmentRight];
    [FabuBtn.titleLabel setFont:[UIFont systemFontOfSize:20.0f]];
    [FabuBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:FabuBtn];
}

#pragma mark-  UILabel
- (void)Label
{
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    lineLabel.text = @"";
    lineLabel.textColor = [UIColor lightGrayColor];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    lineLabel.font = [UIFont systemFontOfSize:17.0];
    
    lineLabel.layer.borderWidth  = 1.0f;
    lineLabel.layer.borderColor  = [UIColor darkGrayColor].CGColor;
    lineLabel.layer.cornerRadius = 5.0f;
    [self.view addSubview:lineLabel];
//------富文本设置11------------------------------------
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 150, 34)];
    label2.textAlignment=NSTextAlignmentLeft;
    label2.text = @"易宝支付";
    label2.font=[UIFont fontWithName:@"Arial" size:14];
    
    NSString *blanceStr=[NSString stringWithFormat:@"可用余额:1000元"];
    NSMutableAttributedString *str1=[[NSMutableAttributedString alloc] initWithString:blanceStr];
    [str1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, blanceStr.length-6)];
    label2.attributedText=str1;
    //------富文本设置22------------------------------------

    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor whiteColor], UITextAttributeTextColor,
                                                          [UIFont systemFontOfSize:18.0], UITextAttributeFont,
                                                          [UIColor clearColor], UITextAttributeTextShadowColor, nil]];

    [self.view addSubview:label2];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, self.view.frame.size.width-40, 100)];
    label.font = [UIFont systemFontOfSize:17.0];
    label.numberOfLines = 0;
    label.textAlignment=NSTextAlignmentLeft;
    NSString *blanceStr1=[NSString stringWithFormat:@"(选择题 2.0分)下列叙述不对的是：[____]"];
    label.text = blanceStr1;
    label.attributedText=[self GXHSetthespacing:label];
    [self.view addSubview:label];
}

-(NSMutableAttributedString *)GXHSetthespacing:(UILabel *)label
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:label.text];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//设置字符串  行间距
    [paragraphStyle setLineSpacing:2.5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, label.text.length)];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 10)];
    return attributedString;
    
}


#pragma mark-  UIImageView
- (void)addUIimageView
{
    UIImageView *imageV1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    imageV1.image = [UIImage imageNamed:@"物业6.png"];
    [self.view addSubview:imageV1];
}

#pragma mark-  UIScrollView
- (void)addScrollView
{
    UIScrollView *_scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, 568-64-49-30)];
    _scrollView.delegate=self;
    _scrollView.showsHorizontalScrollIndicator=FALSE;
    _scrollView.showsVerticalScrollIndicator=FALSE;
    _scrollView.pagingEnabled=YES;
    [self.view addSubview:_scrollView];
}


#pragma mark-  UIBarButtonItem
- (void)UIBarButtonItem
{
    UIButton *leftBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBarBtn setBackgroundImage:[UIImage imageNamed:@"nav_back.png"] forState:UIControlStateNormal];
    leftBarBtn.frame=CGRectMake(0, 0, 12, 20);
    leftBarBtn.tag = 101;
    [leftBarBtn addTarget:self action:@selector(rightBarBtnSelect:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}


#pragma mark- 打电话
- (void)telBtn:(id)sender {
    /*
     //NSString *num = [[NSString alloc] initWithFormat:@"tel://%@",number]; //结束电话之后会进入联系人列表
     NSString *num = [[NSString alloc] initWithFormat:@"telprompt://%@",self.telepLabel.text]; //而这个方法则打电话前先弹框,打完电话之后回到程序中
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
     
     */
}

#pragma mark- 通知
- (void)tNotifi:(id)sender {
/*
    [[NSNotificationCenter defaultCenter] postNotificationName:@"actyTypeNotification" object:dic];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(homedown) name:@"talkpoprefreshNotification" object:nil];
 
 */
 
}
#pragma mark-  计算table的高度   两个for循环
- (void)heightForTable
{
//    table2Height = 44;
//    for (int i=0; i<discussListArray.count; i++)
//    {
//        CGFloat rectionHeight = [[[discussListArray objectAtIndex:i] objectForKey:@"content"] sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(154, 1000) lineBreakMode:NSLineBreakByCharWrapping].height +72;
//        table2Height = table2Height + rectionHeight +44 ;
//
//        NSArray *commentListA = [[discussListArray objectAtIndex:i] objectForKey:@"commentList"];
//        int k = [commentListA count];
//        if (k >0) {
//            for (int j=0; j<k; j++)
//            {
//                NSString *content = [[commentListA objectAtIndex:j] objectForKey:@"content"];
//                CGFloat cellHeight = [content sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(238, 1000) lineBreakMode:NSLineBreakByCharWrapping].height;
//                CGFloat cellHeight1 = cellHeight + 30;
//                table2Height = table2Height + cellHeight1;
//
//            }
//            
//        }
//    }
//    
 
}

#pragma mark-  tableView 同时加载两种 cell

//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
//    if (indexPath.section==0)
//    {
//        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake1(10, 10, 80, 34)];
//        label1.textAlignment=NSTextAlignmentLeft;
//        label1.text = @"充值平台:";
//        label1.font=[UIFont fontWithName:@"Arial" size:14];
//        [cell.contentView addSubview:label1];
//        
//        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake1(90, 10, 150, 34)];
//        label2.textAlignment=NSTextAlignmentLeft;
//        label2.text = @"易宝支付";
//        label2.font=[UIFont fontWithName:@"Arial" size:14];
//        [cell.contentView addSubview:label2];
//        
//        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake1(10, 44, 80, 44)];
//        label3.textAlignment=NSTextAlignmentLeft;
//        label3.text = @"可用余额:";
//        label3.font=[UIFont fontWithName:@"Arial" size:14];
//        [cell.contentView addSubview:label3];
//        
//        UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake1(90, 44, 150, 44)];
//        label4.textAlignment=NSTextAlignmentLeft;
//        label4.font=[UIFont fontWithName:@"Arial" size:14];
//        NSString *moneyString = [NSString stringWithFormat:@"%@元",self.yuMoneyStr];
//        NSMutableAttributedString *mutableString = [[NSMutableAttributedString alloc] initWithString:moneyString];
//        [mutableString addAttribute:NSForegroundColorAttributeName value:RGBAYELLOW range:NSMakeRange(0, moneyString.length-1)];
//        label4.attributedText = mutableString;
//        [cell.contentView addSubview:label4];
//        
//    }
//    if (indexPath.section==1)
//    {
//        cell=[[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//        CustomTableViewCell *cell2=(CustomTableViewCell*)cell;
//        cell2.allLabel.text=@"充值金额";
//        cell2.allTextField.placeholder=@"请输入充值金额";
//        _moneyStr1 = cell2.allTextField.text;
//        cell2.allTextField.delegate = self;
//        UIImageView *image3=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiantiao@2x"]];
//        image3.frame=CGRectMake(0, 43, self.view.frame.size.width, 1);
//        [cell2.contentView addSubview:image3];
//    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    return cell;
//}

#pragma mark-  九宫格
- (void)typeBtnClick
{
//    fabuView.typeBtn.userInteractionEnabled = NO;
//    
//    imageNameArray = [NSArray arrayWithObjects:@"拼车",@"拼旅游",@"拼k歌",@"拼商品",@"拼健身",@"拼广场舞",@"拼宠物",@"拼球类",@"拼跑步",@"拼棋牌",@"拼吃货",@"跳蚤市场",@"其他", nil];
//    CGFloat btnW=72;
//    CGFloat btnH=70;
//    typeView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 320, 360)];
//    typeView.backgroundColor = [UIColor whiteColor];
//    [fabuView addSubview:typeView];
//    
//    for (int i=0; i<13; i++)
//    {
//        CGFloat btnIntervalX = (320-72*4)/5;
//        CGFloat btnIntervalY = 20.0;
//        CGFloat fX = btnIntervalX +(btnW + btnIntervalX)*(i%4);
//        CGFloat fY = (btnH + btnIntervalY)*(i/4);
//        
//        UIButton *littleTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        littleTypeBtn.frame = CGRectMake(fX, fY, 72, 70);
//        [littleTypeBtn setBackgroundImage:[UIImage imageNamed:[imageNameArray objectAtIndex:i]] forState:UIControlStateNormal];
//        littleTypeBtn.tag= i;
//        [littleTypeBtn addTarget:self action:@selector(dismisslittleTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [typeView addSubview:littleTypeBtn];
//        
//        littleTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(littleTypeBtn.frame.origin.x, littleTypeBtn.frame.origin.y+70, littleTypeBtn.frame.size.width, 20)];
//        littleTypeLabel.text = [imageNameArray objectAtIndex:i];
//        littleTypeLabel.textAlignment = NSTextAlignmentCenter;
//        [typeView addSubview:littleTypeLabel];
//    }
    
}

#pragma mark-  CommunityIndicator
- (void)CommunityIndicator
{
//   [[CommunityIndicator sharedInstance] startLoading];
    
//    [[CommunityIndicator sharedInstance] hideIndicator:YES];
    
}

#pragma mark-  定时器NSTimer
- (void)NSTimer
{
    static  NSTimer * timer;
    if(timer == nil)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(changesize) userInfo:nil repeats:YES];
        
    }
    //启动定时器，第一个参数表示间隔时间
    //最后一个参数表示是否重复，如果添YES，表示每n秒做一次，如果添NO表示n秒后，执行一次，然后就不执行了。
    //创建即启动，停止即销毁。
    else{
        [timer invalidate];
        timer = nil;
    }
}

#pragma mark-  UIAlertView
- (void)UIAlertView
{
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"" delegate:self cancelButtonTitle:@"" otherButtonTitles:@"", nil];
    alertview.tag = 1000;
    alertview.delegate = self;
    [alertview show];
}


#pragma mark-  xib 创建UIView
- (void)UIView
{
     //1.新建MyView 2.新建Empty的Xib 3，拖入一个View --选中View修改Class为MyView --设置frame为freedom改变大小  --设置status为none去掉电池  --在使用处导入。h头文件  --- (void)viewDidLoad填写下面代码
    
    //此处 MyView 要改名字
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"MyView" owner:self options:nil];
    MyView *myView = [array objectAtIndex:0];
    //xib坐标一定要和此处一致，不然控件不响应
    myView.frame = CGRectMake(0, 0, 320, 600);
    [self.view addSubview:myView];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor,[UIFont fontWithName:@"SnellRoundhand-Bold" size:24],UITextAttributeFont ,nil];
    [myView.mySegment setTitleTextAttributes:dic forState:UIControlStateNormal];
    

}

#pragma mark-xib构建的scrollView无法滚动  添加辅助方法！！！！！！！！！！！！！
//-(void) viewDidAppear:(BOOL)animated{
//    
//    self.myScrollview.frame= CGRectMake(0, 0, 320, 580);
//    
//    [self.myScrollview setContentSize:CGSizeMake(320, 1000)];
//    
//}


#pragma mark-  UIButton 九宫格筛选功能
- (void)timeBtnClick:(UIButton *)tBtn
{
    if (![tBtn isSelected])
    {
        for (int i=100; i<104; i++)
        {
            if (i==tBtn.tag)
            {
                [tBtn setSelected:YES];
                continue;
            }
            UIButton *button=(UIButton *)[self.view viewWithTag:i];
            if ([button isSelected])
            {
                [button setSelected:NO];
            }
        }
    }
    
}
- (void)timeBtnClick2:(UIButton *)tBtn
{
    if (![tBtn isSelected])
    {
        for (int i=100; i<104; i++)
        {//tag值最好不要从0开始设置，因为相同tag值的view太多 可能会冲突导致crash
            if (i==tBtn.tag)
            {
                [tBtn setSelected:YES];
                [tBtn setBackgroundColor:[UIColor grayColor]];
                continue;
            }else
            {
                UIButton *button=(UIButton *)[self.view viewWithTag:i];
                if ([button isSelected])
                {
                    [button setSelected:NO];
                    [button setBackgroundColor:[UIColor whiteColor]];
                }
            }
        }
    }
    
}



#pragma mark- UITableView
- (void)UITableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, self.view.bounds.size.height-64) style:UITableViewStylePlain];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setShowsVerticalScrollIndicator:NO];
    tableView.scrollEnabled = NO;

    [tableView setBackgroundColor:[UIColor clearColor]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:tableView];

}

#pragma mark--判断字符串是否为空
- (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    else if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    else if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

#pragma mark--textFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;{
    
    if(textField.tag==100){
        if(range.location >5){
            return NO;
        }
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    _mainScrollView.contentOffset = CGPointMake(0, 100);
    return YES;
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [self.view endEditing:YES];
//    _mainScrollView.contentOffset = CGPointMake(0, 0);
    return YES;
    
}
//键盘消失 代理和手势
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
}

- (void)NSStringSizeAndMoreText {
    
    NSDictionary *tuiDic = @{@"str1":@"5",@"str2":@"50",@"str3":@"500"};
    
    NSString *str1 = [tuiDic objectForKey:@"str1"];
    NSString *str2 = [tuiDic objectForKey:@"str2"];
    NSString *str3 = [tuiDic objectForKey:@"str3"];
    
    UILabel *tuiguangLabel = [[UILabel alloc] init];
    tuiguangLabel.textColor = [UIColor blackColor];
    tuiguangLabel.font = [UIFont systemFontOfSize:14];
    
    NSString *allstr = [NSString stringWithFormat:@"推广用户%@个，总计%@笔，赚取佣金%@元。",str1,str2,str3];
#pragma mark--计算字符串尺寸
    //计算字符串尺寸
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGSize maxSize = CGSizeMake(300, 300);
    CGSize size4 = [allstr boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    tuiguangLabel.frame = CGRectMake(10, 100, size4.width, 41);
    
    //富文本编辑
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:allstr];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(4, str1.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(8+str1.length, str2.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(14+str1.length+str2.length, str3.length)];
    
    
    tuiguangLabel.attributedText = attributedString;
    tuiguangLabel.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:tuiguangLabel];
    
}


#pragma mark-- NSMutableAttributedString 字体大小和颜色值花样排版设置方法

- (void)NSMutableAttributedString
{
    UILabel *balanceLabel = [[UILabel alloc]init];
    NSString *blanceStr=[NSString stringWithFormat:@"可用余额:1000元"];
    NSMutableAttributedString *str1=[[NSMutableAttributedString alloc] initWithString:blanceStr];
//颜色值
    [str1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, blanceStr.length-6)];
//字体大小
    [str1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:28] range:NSMakeRange(0, 2)];

    balanceLabel.attributedText=str1;
    
    
    
    
#pragma mark--文字上划一道横线的效果
    //-----
    NSString *productString=@"xuexixindongxi76543345565y456654";
    NSUInteger length = [productString length]/2;
    //学习新东西2
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:productString];
    //文字上划一道横线的效果
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, length)];
    
    [balanceLabel setAttributedText:attri];

}

#pragma mark-- NSString 封装的方法

//- (BOOL)isEmptyOrBlank
//{
//    //此方法用 maomaoString  调用     //  [maomaoString isEmptyOrBlank]
//
//    if([self length] == 0) { //string is empty or nil
//        return YES;
//    }
//    
//    if(![[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length])
//    {
//        //string is all whitespace
//        return YES;
//    }
//    
//    return NO;
//}

- (void)zitiChangDu
{/*
  
  if (name == nil || [name isEmptyOrBlank]) {
  [[CommunityIndicator sharedInstance] showNoteWithTextAutoHide:@"请输入昵称"];
  return;
  }
  if ([name characterLength] > 9) {
  [[CommunityIndicator sharedInstance] showNoteWithTextAutoHide:@"姓名长度超过限制"];
  return;
  }
  
  */
    
}

#pragma mark--屏幕适配 目前所有机型
- (void)shipeiiPhonePingmu
{
    //屏幕适配 目前所有机型
    /*
    
    myScrollview.contentSize = CGSizeMake(320, dataListArray.count*80+31);
    if (kScreenHeight<481 && dataListArray.count*80<451) {
        myScrollview.contentSize = CGSizeMake(320, 481);
    }else if (kScreenHeight>481&&kScreenHeight<569&&dataListArray.count*80<539)
    {
        myScrollview.contentSize = CGSizeMake(320, 569);
        
    }else if (kScreenHeight>569&&kScreenHeight<961&&dataListArray.count*80<931)
    {
        myScrollview.contentSize = CGSizeMake(320, 961);
    }
     
     */

}
#pragma mark--找到对应的 cell
-(void)MHPeleteBtnClick:(UIButton*)sender
{
    /*

    UITableViewCell *cell = (UITableViewCell *)sender.superview.superview;
    //然后使用indexPathForCell方法，就得到indexPath了~
    NSIndexPath *indexPath = [shareTable indexPathForCell:cell];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"您确定要删除此条评论吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    NSArray *array1 = [[shareListArray objectAtIndex:indexPath.section-1] objectForKey:@"commentList"];
    
    deletePingString = [[array1 objectAtIndex:indexPath.row-2] objectForKey:@"id"];
    NSLog(@"deletePingString===%@====",deletePingString);
    
    alert.tag = 1001;
    alert.delegate = self;
    [alert show];
     
      */
    
}

//-(NSString *)foundTextField:(int)tag secion:(int)secion
//{
//    //找到对应的 cell 上的信息
//    CustomTableViewCell *cell=(CustomTableViewCell*)[_bgTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:tag inSection:secion]];
//    return cell.allTextField.text;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstBtn:(id)sender {
    FirstViewController *firstvc = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstvc animated:YES];
}
@end
