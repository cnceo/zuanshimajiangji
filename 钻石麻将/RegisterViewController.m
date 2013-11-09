//
//  RegisterViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-4.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
{
    UITextField *nameTextField;
    UITextField *phoneTextField;
    UITextField *testTextField;
    UITextField *oldTextField;
    UITextField *newTextField;
}
@end

@implementation RegisterViewController

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
    [titleLab setTitle:@"注册          " forState:UIControlStateNormal];
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
    
    NSArray *infos=@[@"输入用户名",@"请输入手机号码",@"输入验证码",@"请输入密码",@"重复确认密码"];
    UIImage *infoBackImage=[UIImage imageNamed:@"writebg_login"];
    for (int i=0; i<infos.count; i++) {
        //添加背景
        UIImageView *backImageView;
        if (i>1) {
            backImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 15+(300*infoBackImage.size.height/infoBackImage.size.width+10)*(i+1), 300, 300*infoBackImage.size.height/infoBackImage.size.width)];
            backImageView.image=infoBackImage;
        }else{
            backImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 15+(300*infoBackImage.size.height/infoBackImage.size.width+10)*i, 300, 300*infoBackImage.size.height/infoBackImage.size.width)];
            backImageView.image=infoBackImage;
        }
        
        backImageView.userInteractionEnabled=YES;
        [self.view addSubview:backImageView];
        //添加输入框
        UITextField *textField=[[UITextField alloc] initWithFrame:CGRectMake(15, 0, 300-15, 300*infoBackImage.size.height/infoBackImage.size.width)];
        textField.tag=i;
        textField.font=[UIFont fontWithName:@"ZhunYuan" size:17];
        [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [textField setPlaceholder:[infos objectAtIndex:i]];
        [backImageView addSubview:textField];
        textField.textColor=[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
        if (i==0) {
            nameTextField=textField;
        }else {
            if(i==1){
                phoneTextField=textField;
                textField.keyboardType=UIKeyboardTypeNumberPad;
                //获取验证码按钮按钮
                UIImage *loginImage=[UIImage imageNamed:@"button_login"];
                UIButton *loginButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 160, 160*loginImage.size.height/loginImage.size.width)];
                loginButton.tag=0;
                [loginButton setBackgroundImage:loginImage forState:UIControlStateNormal];
                loginButton.center=CGPointMake(160,95+(300*infoBackImage.size.height/infoBackImage.size.width+10)*i);
                [loginButton setTitle:@"获取验证码" forState:UIControlStateNormal];
                loginButton.titleLabel.font=[UIFont fontWithName:@"ZhunaYuan" size:17];
                [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:loginButton];
            }else if(i==2){
                testTextField=textField;
            }else if(i==3){
                oldTextField=textField;
                textField.secureTextEntry=YES;
            }else if(i==4){
                newTextField=textField;
                textField.secureTextEntry=YES;
                //获取验证码按钮按钮
                UIImage *loginImage=[UIImage imageNamed:@"button_login"];
                UIButton *loginButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 160, 160*loginImage.size.height/loginImage.size.width)];
                loginButton.tag=1;
                [loginButton setBackgroundImage:loginImage forState:UIControlStateNormal];
                loginButton.center=CGPointMake(160, 95+(300*infoBackImage.size.height/infoBackImage.size.width+10)*(i+1));
                [loginButton setTitle:@"提交" forState:UIControlStateNormal];
                loginButton.titleLabel.font=[UIFont fontWithName:@"ZhunaYuan" size:17];
                [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:loginButton];
            }
            [textField addTarget:self action:@selector(textBeginEdit:) forControlEvents:UIControlEventEditingDidBegin];
        }
    }
}
//取消按钮事件
-(void)cancelButtonClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//开始编辑时间
-(void)textBeginEdit:(UITextField *)textField
{
    CGRect frame=self.view.frame;
    if (textField.tag==1) {
        frame.origin.y=-50;
    }else{
        frame.origin.y=-100-(textField.tag-1)*45;
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame=frame;
    }];
}
//触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView *v in self.view.subviews) {
        for (UIView *vi in v.subviews) {
            [vi resignFirstResponder];
        }
    }
    CGRect frame=self.view.frame;

    frame.origin.y=0;

    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame=frame;
    }];
}
-(void)loginButtonClick:(UIButton *)button
{
    if (button.tag==0) {
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
