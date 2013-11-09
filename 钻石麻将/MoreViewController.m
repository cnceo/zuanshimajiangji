//
//  MoreViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-5.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "MoreViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface MoreViewController ()

@end

@implementation MoreViewController

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
    [titleLab setTitle:@"更多" forState:UIControlStateNormal];
    titleLab.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    [titleLab setTitleColor:[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1] forState:UIControlStateNormal];
    titleLab.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView=titleLab;
    
    UILabel *infoTagLab=[[UILabel alloc] initWithFrame:CGRectMake(15, 20, 100, 20)];
    infoTagLab.textColor=[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    infoTagLab.text=@"版本检测";
    infoTagLab.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    infoTagLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:infoTagLab];
    //添加消息种类
    UIView *infoView=[[UIView alloc] initWithFrame:CGRectMake(10, 50, 300, 50)];
    infoView.layer.cornerRadius=5;
    infoView.layer.borderColor=[[UIColor colorWithRed:162/255.0 green:162/255.0 blue:162/255.0 alpha:1] CGColor];
    infoView.layer.borderWidth=1;
    [self.view addSubview:infoView];
    NSArray *infos=@[@"已是最新版本"];
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
    }
    
    //添加分割线
    UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 120, 320, 2)];
    sepImageView.image=[UIImage imageNamed:@"line_answer"];
    [self.view addSubview:sepImageView];
    
    infoTagLab=[[UILabel alloc] initWithFrame:CGRectMake(15, 140, 100, 20)];
    infoTagLab.textColor=[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    infoTagLab.text=@"技术知识";
    infoTagLab.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    infoTagLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:infoTagLab];
    //添加消息种类
    infoView=[[UIView alloc] initWithFrame:CGRectMake(10, 170, 300, 150)];
    infoView.layer.cornerRadius=5;
    infoView.layer.borderColor=[[UIColor colorWithRed:162/255.0 green:162/255.0 blue:162/255.0 alpha:1] CGColor];
    infoView.layer.borderWidth=1;
    [self.view addSubview:infoView];
    infos=@[@"麻将机的保养",@"麻将机的日常检修",@"如何应对麻将机卡机"];
    for (int i=0; i<infos.count; i++) {
        UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(10, 50*i, 280, 50)];
        [button setTitleColor:[UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitle:[infos objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(infoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i+1;
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
}
-(void)infoButtonClick:(UIButton *)button
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
