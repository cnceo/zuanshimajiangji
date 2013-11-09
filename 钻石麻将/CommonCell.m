//
//  CommonCell.m
//  钻石麻将
//
//  Created by 向 文品 on 13-11-8.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "CommonCell.h"
#import <QuartzCore/QuartzCore.h>
#import "myDefine.h"
@implementation CommonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置颜色
        self.backgroundColor=[UIColor clearColor];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        //添加容器
        self.bodyView=[[UIView alloc] initWithFrame:CGRectMake(8, 10, 304, 40)];
        self.bodyView.layer.cornerRadius=5;
        self.bodyView.layer.borderWidth=1;
        self.bodyView.layer.borderColor=[[UIColor colorWithRed:162/255.0 green:162/255.0 blue:162/255.0 alpha:1] CGColor];
        self.bodyView.clipsToBounds=YES;
        [self.contentView addSubview:self.bodyView];
        //添加标题
        self.titleLab=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 280, 40)];
        self.titleLab.backgroundColor=[UIColor clearColor];
        self.titleLab.font=[UIFont fontWithName:@"ZhunYuan" size:15];
        self.titleLab.textColor=TEXTGRAYCOLOR;
        [self.bodyView addSubview:self.titleLab];
        //添加分割线
        UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5, 40, 290, 2)];
        sepImageView.image=[UIImage imageNamed:@"line_answer"];
        [self.bodyView addSubview:sepImageView];
        //添加按钮
        self.moreButton=[[UIImageView alloc] initWithFrame:CGRectMake(285, 25, 16, 11)];
        self.moreButton.image=[UIImage imageNamed:@"jiantou_answer"];
        self.moreButton.transform=CGAffineTransformMakeRotation(-M_PI_2);
        [self.contentView addSubview:self.moreButton];
        //添加内容
        self.detailInfoLab=[[UILabel alloc] initWithFrame:CGRectMake(10, 50, 284, 85)];
        self.detailInfoLab.font=[UIFont fontWithName:@"ZhunYuan" size:14];
        self.detailInfoLab.textColor=[UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1];
        self.detailInfoLab.backgroundColor=[UIColor clearColor];
        [self.bodyView addSubview:self.detailInfoLab];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
