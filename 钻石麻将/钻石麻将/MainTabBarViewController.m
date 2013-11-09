//
//  MainTabBarViewController.m
//  零点校园
//
//  Created by 向 文品 on 13-9-1.
//  Copyright (c) 2013年 Demo. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()
{
    UIButton *lastSelectButton;
}
@end

@implementation MainTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}




- (void)makeTabBarHidden:(BOOL)hide {
    if ( [self.view.subviews count] < 2 )
        return;
    
    UIView *contentView;
    
    if ( [[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.view.subviews objectAtIndex:1];
    else
        contentView = [self.view.subviews objectAtIndex:0];
    
    if ( hide ){
        contentView.frame = self.view.bounds;
    }
    else{
        contentView.frame = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height - self.tabBar.frame.size.height);
    }
    
    self.tabBar.hidden = hide;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *titleArray=@[@"view",@"home",@"class",@"map",@"more"];
    UIImage *tabImage=[UIImage imageNamed:@"view1_tabbar.png"];
    float screenHeight=[UIScreen mainScreen].bounds.size.height;
    float tabHeight=64*tabImage.size.height/tabImage.size.width;
    //添加背景
    UIImageView *tabbarBgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, screenHeight-tabHeight+5, 320, tabHeight-5)];
    tabbarBgView.userInteractionEnabled=YES;
    tabbarBgView.image=[UIImage imageNamed:@"tabbar_background"];
    [self.view addSubview:tabbarBgView];
    //添加按钮
    for (int i=0; i<titleArray.count; i++) {
        UIButton *titleButton=[[UIButton alloc] initWithFrame:CGRectMake(64*i, -5, 64, tabHeight)];
        titleButton.tag=i;
        NSString *bgImage=[NSString stringWithFormat:@"%@1_tabbar.png",[titleArray objectAtIndex:i]];
        NSString *bgSelectImage=[NSString stringWithFormat:@"%@2_tabbar.png",[titleArray objectAtIndex:i]];
        [titleButton setBackgroundImage:[UIImage imageNamed:bgImage] forState:UIControlStateNormal];
        [titleButton setBackgroundImage:[UIImage imageNamed:bgSelectImage] forState:UIControlStateSelected];
        [titleButton addTarget:self action:@selector(tabbarSelect:) forControlEvents:UIControlEventTouchUpInside];
        [tabbarBgView addSubview:titleButton];
        if (i==0) {
            lastSelectButton=titleButton;
            [self tabbarSelect:titleButton];
        }
    }
    
}
-(void)tabbarSelect:(UIButton *)button
{
    lastSelectButton.selected=NO;
    button.selected=YES;
    lastSelectButton=button;
    self.selectedIndex=button.tag;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
