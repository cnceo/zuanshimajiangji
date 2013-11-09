//
//  PersonCenterViewController.m
//  钻石麻将
//
//  Created by 向 文品 on 13-11-8.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "myDefine.h"
#import <QuartzCore/QuartzCore.h>
@interface PersonCenterViewController ()
{
    UILabel *usernameLab;
    UIButton *loginButton;
    UIButton *registerButton;
}
@end

@implementation PersonCenterViewController

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
    UIButton *titleLab=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [titleLab setTitle:@"个人中心        " forState:UIControlStateNormal];
    titleLab.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    [titleLab setTitleColor:[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1] forState:UIControlStateNormal];
    titleLab.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView=titleLab;
    
    //添加取消按钮
    UIImage *cancelImage=[UIImage imageNamed:@"bthome_collect"];
    UIButton *cancelButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20*cancelImage.size.width/cancelImage.size.height, 20)];
    [cancelButton setBackgroundImage:cancelImage forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancelItem=[[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem=cancelItem;
    //添加个人背景
    UIImage *personImage=[UIImage imageNamed:@"kuuang_geren"];
    UIImageView *personImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 300*personImage.size.height/personImage.size.width)];
    personImageView.image=personImage;
    personImageView.layer.cornerRadius=5;
    personImageView.layer.borderColor=[[UIColor colorWithRed:162/255.0 green:162/255.0 blue:162/255.0 alpha:1] CGColor];
    personImageView.layer.borderWidth=1;
    [self.view addSubview:personImageView];
    //添加个人信息名称
    usernameLab=[[UILabel alloc] initWithFrame:CGRectMake(50, 0, 250, 300*personImage.size.height/personImage.size.width)];
    usernameLab.text=@"尚未登录";
    usernameLab.backgroundColor=[UIColor clearColor];
    usernameLab.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    usernameLab.textColor=TEXTGRAYCOLOR;
    [personImageView addSubview:usernameLab];
    //添加登陆祖册
    NSArray *titles=@[@"登录",@"注册"];
    for (int i=0; i<titles.count; i++) {
        UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(180+60*i, 20, 55, 34)];
        [button setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"buttonbg_geren"] forState:UIControlStateNormal];
        [button setTitleColor:TEXTBLUECOLOR forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:17];
        [self.view addSubview:button];
        if (i==0) {
            loginButton=button;
            [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
        }else{
            registerButton=button;
            [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    //添加最新消息
    UILabel *infoTagLab=[[UILabel alloc] initWithFrame:CGRectMake(15, 75, 100, 20)];
    infoTagLab.textColor=[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    infoTagLab.text=@"最新消息";
    infoTagLab.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    infoTagLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:infoTagLab];
    //添加消息种类
    UIView *infoView=[[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 150)];
    infoView.layer.cornerRadius=5;
    infoView.layer.borderColor=[[UIColor colorWithRed:162/255.0 green:162/255.0 blue:162/255.0 alpha:1] CGColor];
    infoView.layer.borderWidth=1;
    [self.view addSubview:infoView];
    NSArray *infos=@[@"商品限时特惠促销",@"新品上市选购",@"回馈新老客户以旧换新大优惠"];
    for (int i=0; i<infos.count; i++) {
        UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(10, 50*i, 280, 50)];
        [button setTitleColor:[UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitle:[infos objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(infoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i;
        button.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:16];
        [infoView addSubview:button];
        CGSize size = CGSizeMake(300, 50);
        
        CGSize msgSie = [button.titleLabel.text sizeWithFont:button.titleLabel.font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        CGRect frame=button.frame;
        frame.size.width=msgSie.width;
        button.frame=frame;
        //添加按钮
        UIImageView *moreButton=[[UIImageView alloc] initWithFrame:CGRectMake(265, 20+50*i, 16, 11)];
        moreButton.image=[UIImage imageNamed:@"jiantou_answer"];
        moreButton.transform=CGAffineTransformMakeRotation(-M_PI_2);
        [infoView addSubview:moreButton];
        //添加分割线
        UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5, 50*i, 290, 2)];
        sepImageView.image=[UIImage imageNamed:@"line_answer"];
        [infoView addSubview:sepImageView];
    }
    //添加退出按钮
    UIImage *loginImage=[UIImage imageNamed:@"button_login"];
    UIButton *logoutButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 160, 160*loginImage.size.height/loginImage.size.width)];
    [logoutButton setBackgroundImage:loginImage forState:UIControlStateNormal];
    logoutButton.center=CGPointMake(160, [UIScreen mainScreen].bounds.size.height-150);
    [logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    logoutButton.titleLabel.font=[UIFont fontWithName:@"ZhunaYuan" size:17];
    [logoutButton addTarget:self action:@selector(logoutButtonButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutButton];
}
-(void)loginButtonClick
{
    
}
-(void)registerButtonClick
{
    
}
-(void)infoButtonClick:(UIButton *)button
{
    
}
-(void)logoutButtonButtonClick
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
