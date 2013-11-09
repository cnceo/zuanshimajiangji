//
//  FatherViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-5.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "FatherViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface FatherViewController ()

@end

@implementation FatherViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.view.layer.masksToBounds=YES;
        self.view.layer.cornerRadius=5;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
