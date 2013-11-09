//
//  DongTaiDetailViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "DongTaiDetailViewController.h"
#import "AsyncImageView.h"
#import "myDefine.h"
@interface DongTaiDetailViewController ()

@end

@implementation DongTaiDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIImageView *backImageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
    backImageView.image=[UIImage imageNamed:@"bg960.png"];
    [self.view addSubview:backImageView];
    //设置标题
    NSArray *titles=@[@"动态详情",@"技术知识",@"最新消息"];
    UIButton *titleLab=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [titleLab setTitle:[NSString stringWithFormat:@"%@          ",[titles objectAtIndex:self.selectType]] forState:UIControlStateNormal];
    titleLab.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    [titleLab setTitleColor:[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1] forState:UIControlStateNormal];
    titleLab.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView=titleLab;
    //添加取消按钮
    UIImage *cancelImage=[UIImage imageNamed:@"back_login"];
    UIButton *cancelButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20*cancelImage.size.width/cancelImage.size.height, 20)];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"back_login"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancelItem=[[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem=cancelItem;
    //添加标题
    UILabel *titleBarLab=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
    titleBarLab.textAlignment=NSTextAlignmentCenter;
    titleBarLab.text=@"文章标题";
    titleBarLab.textColor=[UIColor colorWithRed:68/255.0 green:124/255.0 blue:171/255.0 alpha:1];
    titleBarLab.backgroundColor=[UIColor clearColor];
    titleBarLab.font=[UIFont fontWithName:@"ZhunYuan" size:17];
    titleBarLab.numberOfLines=0;
    [self.view addSubview:titleBarLab];
    //设置标题长度
    CGSize size = CGSizeMake(300, 1000);
    
    CGSize msgSie = [titleBarLab.text sizeWithFont:titleBarLab.font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    CGRect frame=titleBarLab.frame;
    frame.size.height=msgSie.height;
    //添加日期
    //添加时间
    UILabel *timeLab=[[UILabel alloc] initWithFrame:CGRectMake(230, 15+msgSie.height, 100, 15)];
    timeLab.text=@"[2013-10-10]";
    timeLab.backgroundColor=[UIColor clearColor];
    timeLab.textColor=[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    timeLab.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:timeLab];
    //添加分割线
    UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, msgSie.height+40, 320, 2)];
    sepImageView.image=[UIImage imageNamed:@"line_whitekuang"];
    [self.view addSubview:sepImageView];
    //添加图片
    AsyncImageView *infoImageView=[[AsyncImageView alloc] initWithFrame:CGRectMake(5, msgSie.height+45, 310, 150)];
    infoImageView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:infoImageView];
    //添加详细说明
    UITextView *detailTextView=[[UITextView alloc] initWithFrame:CGRectMake(0, msgSie.height+200, 320, [UIScreen mainScreen].bounds.size.height-64-200)];
    detailTextView.text=@"是的的是的的是的的是的但是都是但是但是个人我人vwrbv认为 位位飞位 位飞为vwever不v";
    detailTextView.backgroundColor=[UIColor clearColor];
    detailTextView.editable=NO;
    detailTextView.font=[UIFont fontWithName:@"ZhunYuan" size:17];
    detailTextView.textColor=TEXTGRAYCOLOR;
    [self.view addSubview:detailTextView];
}
//返回事件
-(void)cancelButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
