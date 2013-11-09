//
//  JingDianMapCell.m
//  IYLM
//
//  Created by Jian-Ye on 12-11-8.
//  Copyright (c) 2012年 Jian-Ye. All rights reserved.
//

#import "JingDianMapCell.h"
#import <QuartzCore/QuartzCore.h>
#import "myDefine.h"
@implementation JingDianMapCell

- (id)init
{
    self = [super init];
    if (self) {
        //self.clipsToBounds=YES;
        UIImageView *bgImageView=[[UIImageView alloc] initWithFrame:CGRectMake(-5, 0, 250, 130)];
        bgImageView.layer.masksToBounds=YES;
        bgImageView.layer.cornerRadius=3;
        bgImageView.image=[UIImage imageNamed:@"whitekuang_map"];
        [self addSubview:bgImageView];
        //添加标题
        self.titleLab=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
        self.titleLab.backgroundColor=[UIColor clearColor];
        self.titleLab.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.titleLab];
        //添加地址
        self.addressLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 30, 200, 20)];
        self.addressLabel.backgroundColor=[UIColor clearColor];
        self.addressLabel.font=[UIFont fontWithName:@"ZhunYuan" size:12];
        self.addressLabel.textColor=[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        [self addSubview:self.addressLabel];
        
        //添加电话按钮
        UIImage *phoneImage=[UIImage imageNamed:@"icon_phone"];
        UIButton *phoneButton=[[UIButton alloc] initWithFrame:CGRectMake(10, 55, 15, 15*phoneImage.size.height/phoneImage.size.width)];
        [phoneButton setBackgroundImage:phoneImage forState:UIControlStateNormal];
        [self addSubview:phoneButton];
        //添加电话号码
        self.phoneLab=[[UILabel alloc] initWithFrame:CGRectMake(30, 55, 150, 20)];
        self.phoneLab.textColor=TEXTBLUECOLOR;
        self.phoneLab.backgroundColor=[UIColor clearColor];
        [self addSubview:self.phoneLab];
        //
        UIImage *navImage=[UIImage imageNamed:@"呼叫导航iphone"];
        UIImageView *navImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5, 80, 230, 230*navImage.size.height/navImage.size.width)];
        navImageView.image=navImage;
        [self insertSubview:navImageView belowSubview:phoneButton];
        
        
    }
    return self;
}

@end
