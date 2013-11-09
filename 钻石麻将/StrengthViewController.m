//
//  StrengthViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-5.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "StrengthViewController.h"

@interface StrengthViewController ()
{
    UIView *detailView;
    UIView *infoView;
    
    UILabel *titleLab;
    UITextView *detailTextView;
    UIButton *pullUpButton;
    UIImageView *collectAchiveImageView;
}
@end

@implementation StrengthViewController

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
    //添加背景图片
    self.detailImageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
    self.detailImageView.image=[UIImage imageNamed:@"demobackimage"];
    self.detailImageView.userInteractionEnabled=YES;
    [self.view addSubview:self.detailImageView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTheView)];
    [self.detailImageView addGestureRecognizer:tap];
    //添加详细页面
	detailView=[[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:detailView];
    tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTheView)];
    [detailView addGestureRecognizer:tap];
    
    //添加导航条
    UIImageView *navbarImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    navbarImageView.image=[UIImage imageNamed:@"titlebar_xiangqing"];
    [detailView addSubview:navbarImageView];
    //添加返回按钮
    UIImage *backImage=[UIImage imageNamed:@"home_jieshao"];
    UIButton *backButton=[[UIButton alloc] initWithFrame:CGRectMake(10, 5, 35*backImage.size.width/backImage.size.height, 35)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [detailView addSubview:backButton];
    
    //添加竖条分割线
    UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(50, 7, 2, 30)];
    sepImageView.image=[UIImage imageNamed:@"topline_xiangqing"];
    [detailView addSubview:sepImageView];
    
    //titleLab
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleLabel.text=@"实力钻石";
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.center=CGPointMake(160, 25);
    [detailView addSubview:titleLabel];
    
    //添加竖条分割线
    sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(265, 7, 2, 30)];
    sepImageView.image=[UIImage imageNamed:@"topline_xiangqing"];
    [detailView addSubview:sepImageView];
    //收藏按钮事件
    UIImage *collectImage=[UIImage imageNamed:@"collect_xiangqing"];
    UIButton *collectButton=[[UIButton alloc] initWithFrame:CGRectMake(10, 5, 40*collectImage.size.width/collectImage.size.height, 40)];
    [collectButton setBackgroundImage:collectImage forState:UIControlStateNormal];
    collectButton.center=CGPointMake(290, 22);
    [collectButton addTarget:self action:@selector(collectButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [detailView addSubview:collectButton];
    //设置信息页面
    float screenHeight=[UIScreen mainScreen].bounds.size.height-20;
    infoView=[[UIView alloc] initWithFrame:CGRectMake(0, screenHeight-200, 320, screenHeight-70)];
    infoView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    [detailView addSubview:infoView];
    //添加渐变线
    UIImageView *shadowInageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 2)];
    shadowInageView.image=[UIImage imageNamed:@"line_downtip"];
    [infoView addSubview:shadowInageView];
    //添加文字说明
    titleLab=[[UILabel alloc] initWithFrame:CGRectMake(15, 15, 300, 20)];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.font=[UIFont fontWithName:@"ZhunYuan" size:17];
    titleLab.text=@"企业介绍";
    titleLab.textColor=[UIColor whiteColor];
    [infoView addSubview:titleLab];
    

    //添加上啦按钮
    pullUpButton=[[UIButton alloc] initWithFrame:CGRectMake(285, 10, 25, 25)];
    [pullUpButton setBackgroundImage:[UIImage imageNamed:@"btup_xiangqing"] forState:UIControlStateNormal];
    [pullUpButton addTarget:self action:@selector(pullUpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [infoView addSubview:pullUpButton];
    //添加分割线
    UIImageView *lineImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 45, 300, 2)];
    lineImageView.image=[UIImage imageNamed:@"linedown_xiangqing"];
    [infoView addSubview: lineImageView];
    //添加详细说明
    detailTextView=[[UITextView alloc] initWithFrame:CGRectMake(0, 60, 320, 200-60)];
    detailTextView.editable=NO;
    detailTextView.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    detailTextView.text=@"钻石之星麻将机\n\t钻石自动麻将机钻石之星系列阿会计陈会计上班开发文档和阿的看法和打ADVAdvDelete打卡机iahdv钻石之星麻将机\n\t钻石自动麻将机钻石之星系列阿会计陈会计上班开发文档和阿的看法和打ADVAdvDelete打卡机iahdv钻石之星麻将机\n\t钻石自动麻将机钻石之星系列阿会计陈会计上班开发文档和阿的看法和打ADVAdvDelete打卡机iahdv";
    detailTextView.backgroundColor=[UIColor clearColor];
    detailTextView.textColor=[UIColor whiteColor];
    [infoView addSubview:detailTextView];
    
}
//返回事件
-(void)backButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//分享事件
-(void)shareButtonClick
{
    NSArray *activityItems= @[@"零点校园是一款不错的应用，让你足不出户，尽享校园乐趣", [UIImage imageNamed:@"demobackimage.png"]];
    
    
    UIActivityViewController *activityController =
    
    [[UIActivityViewController alloc] initWithActivityItems:activityItems  applicationActivities:nil];
    
    [self presentViewController:activityController  animated:YES completion:nil];
}
//收藏按钮事件
-(void)collectButtonClick
{
    if (!collectAchiveImageView) {
        UIImage *collectImage=[UIImage imageNamed:@"tips_xiangqing.png"];
        collectAchiveImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 250*collectImage.size.height/collectImage.size.width)];
        collectAchiveImageView.image=collectImage;
        collectAchiveImageView.center=CGPointMake(160, 200);
        collectAchiveImageView.alpha=0;
        [self.view addSubview:collectAchiveImageView];
    }
    [UIView animateWithDuration:0.5 animations:^{
        collectAchiveImageView.alpha=1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            collectAchiveImageView.alpha=0;
        } completion:^(BOOL finished) {
            
        }];
    }];
    
}
//添加购买事件
-(void)navButtonClick
{
    
}
-(void)pullUpButtonClick:(UIButton *)button
{
    float screenHeight=[UIScreen mainScreen].bounds.size.height;
    CGRect frame=infoView.frame;
    CGRect detailFrame=detailTextView.frame;
    CGAffineTransform transform=pullUpButton.transform;
    
    if (frame.origin.y==70) {
        frame.origin.y=screenHeight-200;
        detailFrame.size.height=200-140;
        transform=CGAffineTransformMakeRotation(0);
    }else{
        frame.origin.y=70;
        detailFrame.size.height=screenHeight-60;
        transform=CGAffineTransformMakeRotation(M_PI);
    }
    [UIView animateWithDuration:0.6 animations:^{
        infoView.frame=frame;
        detailTextView.frame=detailFrame;
        pullUpButton.transform=transform;
    }];
}
-(void)tapTheView
{
    [UIView animateWithDuration:1 animations:^{
        if (detailView.alpha==0) {
            detailView.alpha=1;
        }else{
            detailView.alpha=0;
        }
    }];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
