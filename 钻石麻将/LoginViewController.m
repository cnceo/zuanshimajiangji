//
//  LoginViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-4.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetViewController.h"
#import "RegisterViewController.h"
@interface LoginViewController ()
{
    UITextField *nameTextField;
    UITextField *passwordTextField;
}
@end

@implementation LoginViewController

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
    [titleLab setTitle:@"登录" forState:UIControlStateNormal];
    titleLab.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    [titleLab setTitleColor:[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1] forState:UIControlStateNormal];
    titleLab.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView=titleLab;
    //添加取消按钮
    UIImage *cancelImage=[UIImage imageNamed:@"close_login"];
    UIButton *cancelButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20*cancelImage.size.width/cancelImage.size.height, 20)];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"close_login"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancelItem=[[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem=cancelItem;

    //注册按钮
    UIImage *registerImage=[UIImage imageNamed:@"register_login"];
    UIButton *registerButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30*registerImage.size.width/registerImage.size.height, 30)];
    [registerButton setBackgroundImage:registerImage forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *registerItem=[[UIBarButtonItem alloc] initWithCustomView:registerButton];
    self.navigationItem.rightBarButtonItem=registerItem;
    
    
    NSArray *infos=@[@"输入用户名或手机号",@"请输入密码"];
    UIImage *infoBackImage=[UIImage imageNamed:@"writebg_login"];
    for (int i=0; i<infos.count; i++) {
        //添加背景
        UIImageView *backImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 15+(300*infoBackImage.size.height/infoBackImage.size.width+10)*i, 300, 300*infoBackImage.size.height/infoBackImage.size.width)];
        backImageView.image=infoBackImage;
        backImageView.userInteractionEnabled=YES;
        [self.view addSubview:backImageView];
        //添加输入框
        UITextField *textField=[[UITextField alloc] initWithFrame:CGRectMake(15, 0, 300-15, 300*infoBackImage.size.height/infoBackImage.size.width)];
        textField.font=[UIFont fontWithName:@"ZhunYuan" size:17];
        [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [textField setPlaceholder:[infos objectAtIndex:i]];
        [backImageView addSubview:textField];
        textField.textColor=[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
        if (i==0) {
            nameTextField=textField;
        }else if(i==1){
            passwordTextField=textField;
            textField.secureTextEntry=YES;
        }
    }
    //登录按钮
    UIImage *loginImage=[UIImage imageNamed:@"button_login"];
    UIButton *loginButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 160, 160*loginImage.size.height/loginImage.size.width)];
    [loginButton setBackgroundImage:loginImage forState:UIControlStateNormal];
    loginButton.center=CGPointMake(160, 150);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font=[UIFont fontWithName:@"ZhunaYuan" size:17];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    //添加忘记密码
    UIButton *forgrtButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [forgrtButton setTitleColor:[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1] forState:UIControlStateNormal];
    [forgrtButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
    forgrtButton.center=CGPointMake(160,190);
    [forgrtButton addTarget:self action:@selector(forgetButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgrtButton];
    
}
//取消按钮事件
-(void)cancelButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//注册事件
-(void)registerButtonClick
{
    RegisterViewController *registerVC=[[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
//点击登录时间
-(void)loginButtonClick
{
    
}
//忘记密码点击事件
-(void)forgetButtonClick
{
    ForgetViewController *forgetVC=[[ForgetViewController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
    
}
//触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView *v in self.view.subviews) {
        for (UIView *vi in v.subviews) {
            [vi resignFirstResponder];
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
