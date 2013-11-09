
//
//  CommentViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-7.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "CommentViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "myDefine.h"
@interface CommentViewController ()
{
    UITextView *commentTextView;
    UILabel *commentLab;
}
@end

@implementation CommentViewController

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
    [titleLab setTitle:@"    发表评论" forState:UIControlStateNormal];
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
    UIView *commentBgView=[[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 150)];
    commentBgView.backgroundColor=[UIColor whiteColor];
    commentBgView.layer.cornerRadius=10;
    commentBgView.layer.borderWidth=1;
    commentBgView.layer.borderColor=[[UIColor colorWithRed:170/255.0 green:176/255.0 blue:184/255.0 alpha:1] CGColor];
    [self.view addSubview:commentBgView];
    //注册按钮
    UIImage *registerImage=[UIImage imageNamed:@"buttonbg_white"];
    UIButton *registerButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10+30*registerImage.size.width/registerImage.size.height, 30)];
    [registerButton setBackgroundImage:registerImage forState:UIControlStateNormal];
    [registerButton setTitle:@" 完成" forState:UIControlStateNormal];
    registerButton.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:15];
    [registerButton setTitleColor:TEXTBLUECOLOR forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *registerItem=[[UIBarButtonItem alloc] initWithCustomView:registerButton];
    self.navigationItem.rightBarButtonItem=registerItem;
    //添加背景文字
    commentLab=[[UILabel alloc] initWithFrame:CGRectMake(10,10, 280, 40)];
    commentLab.textColor=[UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1];
    commentLab.numberOfLines=0;
    
    commentLab.text=@"说说本次团购的亮点和不足吧，您的评价是对其他会员重要的参考";
    commentLab.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    [commentBgView addSubview:commentLab];
    //添加评论框
    commentTextView=[[UITextView alloc] initWithFrame:CGRectMake(0,3, 300, 130)];
    commentTextView.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    commentTextView.delegate=self;
    commentTextView.textColor=TEXTGRAYCOLOR;
    commentTextView.backgroundColor=[UIColor clearColor];
    [commentBgView addSubview:commentTextView];
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    commentLab.alpha=0;
}
-(void)textViewDidChange:(UITextView *)textView
{
    if (commentTextView.text.length==0) {
        commentLab.alpha=1;
    }else{
        commentLab.alpha=0;
    }
}
//取消按钮
-(void)cancelButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
//发表评论事件
-(void)registerButtonClick
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
