//
//  BusinessAreaViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "BusinessAreaViewController.h"
#import "BusinessDetailViewController.h"
@interface BusinessAreaViewController ()
{
    UILabel *cityLab;
    UITableView *dataTableView;
}
@end

@implementation BusinessAreaViewController

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
    //添加列表
    dataTableView=[[UITableView alloc] initWithFrame:self.view.bounds];
    dataTableView.backgroundColor=[UIColor clearColor];
    dataTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    dataTableView.dataSource=self;
    dataTableView.delegate=self;
    [self.view addSubview:dataTableView];
	//添加导航条
    UIImageView *navbarImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    navbarImageView.image=[UIImage imageNamed:@"titlebar_xiangqing"];
    [self.view addSubview:navbarImageView];
    //添加返回按钮
    UIImage *backImage=[UIImage imageNamed:@"home_jieshao"];
    UIButton *backButton=[[UIButton alloc] initWithFrame:CGRectMake(10, 5, 35*backImage.size.width/backImage.size.height, 35)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    //添加竖条分割线
    UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(50, 7, 2, 30)];
    sepImageView.image=[UIImage imageNamed:@"topline_xiangqing"];
    [self.view addSubview:sepImageView];
    //titleLab
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleLabel.text=@"配套商圈";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.center=CGPointMake(160, 25);
    [self.view addSubview:titleLabel];
    //添加竖条分割线
    sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(245, 7, 2, 30)];
    sepImageView.image=[UIImage imageNamed:@"topline_xiangqing"];
    [self.view addSubview:sepImageView];
    //收藏按钮事件
    cityLab=[[UILabel alloc] initWithFrame:CGRectMake(270, 8, 50, 30)];
    [cityLab setText:@"成都"];
    cityLab.backgroundColor=[UIColor clearColor];
    cityLab.textColor=[UIColor whiteColor];
    cityLab.clipsToBounds=NO;
    cityLab.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    [self.view addSubview:cityLab];
    //添加导航小图标
    UIImageView *navLittleImageView=[[UIImageView alloc] initWithFrame:CGRectMake(-15, 5, 13.5, 18)];
    navLittleImageView.image=[UIImage imageNamed:@"pitchicon_top"];
    
    [cityLab addSubview:navLittleImageView];
}
//返回事件
-(void)backButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Cell=@"busibessCell";
    BusinessCell *cell=[tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell==nil) {
        cell=[[BusinessCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    cell.addressLab.text=@"春熙路";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 165;
}
//选取商圈事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BusinessDetailViewController *businessDetailVC=[[BusinessDetailViewController alloc] init];
    [self presentViewController:businessDetailVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
