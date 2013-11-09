//
//  SetPasswordViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-4.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "SetPasswordViewController.h"

@interface SetPasswordViewController ()
{
    UITextField *oldTextField;
    UITextField *newTextField;
}
@end

@implementation SetPasswordViewController

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
    [titleLab setTitle:@"找回密码          " forState:UIControlStateNormal];
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
    //添加说明信息
    UILabel *infoLab=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 50)];
    infoLab.textColor=[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
    infoLab.backgroundColor=[UIColor clearColor];
    infoLab.numberOfLines=0;
    infoLab.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    infoLab.text=@"请重新设置您的密码";
    [self.view addSubview:infoLab];
    
    
    
    //添加输入框
    NSArray *infos=@[@"请输入新密码",@"再次确认密码"];
    
    for (int i=0; i<infos.count; i++) {
        UIImage *backImage=[UIImage imageNamed:@"writebg_login"];
        //添加背景
        UIImageView *backImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 65+(300*backImage.size.height/backImage.size.width+10)*i, 300, 300*backImage.size.height/backImage.size.width)];
        backImageView.image=backImage;
        backImageView.userInteractionEnabled=YES;
        [self.view addSubview:backImageView];
        //添加输入框
        UITextField *textField=[[UITextField alloc] initWithFrame:CGRectMake(15, 0, 300-15, 300*backImage.size.height/backImage.size.width)];
        textField.font=[UIFont fontWithName:@"ZhunYuan" size:17];
        [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [textField setPlaceholder:[infos objectAtIndex:i]];
        [backImageView addSubview:textField];
        textField.secureTextEntry=YES;
        textField.textColor=[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
        if (i==0) {
            oldTextField=textField;
        }else if(i==1){
            newTextField=textField;
            
        }
    }
    //获取验证码按钮事件
    UIImage *loginImage=[UIImage imageNamed:@"button_login"];
    UIButton *loginButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 160, 160*loginImage.size.height/loginImage.size.width)];
    [loginButton setBackgroundImage:loginImage forState:UIControlStateNormal];
    loginButton.center=CGPointMake(160, 200);
    [loginButton setTitle:@"下一步" forState:UIControlStateNormal];
    loginButton.titleLabel.font=[UIFont fontWithName:@"ZhunaYuan" size:17];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}
//取消按钮事件
-(void)cancelButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
//获取验证码按钮事件
-(void)loginButtonClick
{
    if (![newTextField.text isEqualToString:oldTextField.text]||newTextField.text.length==0||oldTextField.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"输入密码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
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
