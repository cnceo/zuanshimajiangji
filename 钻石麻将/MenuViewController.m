//
//  MenuViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-5.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "MenuViewController.h"
#import "WhiteNavViewController.h"
#import "LoginViewController.h"
#import "SearchViewController.h"
#import "WebRequest.h"
@interface MenuViewController ()
{
    UIButton *loginButton;
    ASIHTTPRequest *menuRequest;
}
@end

@implementation MenuViewController

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
    UIImageView *bgImageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
    if ([UIScreen mainScreen].bounds.size.height!=480) {
        bgImageView.image=[UIImage imageNamed:@"640-960"];
    }else{
        bgImageView.image=[UIImage imageNamed:@"640-1136"];
    }
    [self.view addSubview:bgImageView];
    //添加导航条
    UIImageView *navbarImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    navbarImageView.image=[UIImage imageNamed:@"titlebar_xiangqing"];
    [self.view addSubview:navbarImageView];
    //添加返回按钮
    UIImage *searchImage=[UIImage imageNamed:@"seach_view"];
    UIButton *searchButton=[[UIButton alloc] initWithFrame:CGRectMake(10, 8, 30*searchImage.size.width/searchImage.size.height, 30)];
    [searchButton setBackgroundImage:searchImage forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    //添加竖条分割线
    UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(50, 7, 2, 30)];
    sepImageView.image=[UIImage imageNamed:@"topline_xiangqing"];
    [self.view addSubview:sepImageView];
    
    //titleLab
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleLabel.text=@"菜单";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.center=CGPointMake(160, 25);
    [self.view addSubview:titleLabel];
    
    //添加竖条分割线
    sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(265, 7, 2, 30)];
    sepImageView.image=[UIImage imageNamed:@"topline_xiangqing"];
    [self.view addSubview:sepImageView];
    //收藏按钮事件
   
    loginButton=[[UIButton alloc] initWithFrame:CGRectMake(10, 7, 50, 40)];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:17];
    loginButton.center=CGPointMake(290, 22);
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    //加载数据
    menuRequest=[[ASIHTTPRequest alloc] initWithURL:[WebRequest getMenuItemsRequest]];
    menuRequest.delegate=self;
    if ([WebRequest isConnectionAvailable ]) {
        [menuRequest startAsynchronous];
    }else{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"目前网络无法连接，请检查网络是否正常" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    
}
//页面将要出现
-(void)viewWillAppear:(BOOL)animated
{
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"accountDic"]) {
        loginButton.alpha=0;
    }else{
        loginButton.alpha=1;
    }
}
//数据加载完成
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString* strdata = [[NSString alloc]initWithData:request.responseData encoding:NSUTF8StringEncoding];
    NSDictionary *dic=[strdata JSONValue];
    NSLog(@"%@",dic);
}
-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"失败");
}
-(void)searchButtonClick
{
    SearchViewController *searchVC=[[SearchViewController alloc] init];
    [self presentViewController:[[WhiteNavViewController alloc] initWithRootViewController:searchVC] animated:YES completion:nil];
}
-(void)loginButtonClick
{
    LoginViewController *loginVC=[[LoginViewController alloc] init];
    [self presentViewController:[[WhiteNavViewController alloc] initWithRootViewController:loginVC] animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
