//
//  WhiteNavViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-4.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "WhiteNavViewController.h"
@interface WhiteNavViewController ()
{
    UIButton *titleLab;
}
@end

@implementation WhiteNavViewController

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
	[self.navigationBar setBackgroundImage:[UIImage imageNamed:@"titlebar_login副本"] forBarMetrics:UIBarMetricsDefault];
    UIColor * cc = [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:cc forKey:UITextAttributeTextColor];
    self.navigationBar.titleTextAttributes = dict;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
