//
//  GoodsCell.m
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "GoodsCell.h"

@implementation GoodsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加白色背景
        UIImageView *bgImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 6, 92, 75)];
        bgImageView.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:bgImageView];
        //添加标题图片
        self.headImageView=[[AsyncImageView alloc] initWithFrame:CGRectMake(3, 3, 86, 69)];
        _headImageView.backgroundColor=[UIColor orangeColor];
        [bgImageView addSubview:self.headImageView];
        //添加标题
        self.titleLab=[[UILabel alloc] initWithFrame:CGRectMake(112, 6, 100, 20)];
        self.titleLab.font=[UIFont systemFontOfSize:15];
        self.titleLab.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.titleLab];
        //添加详情
        self.detailInfoLab=[[UILabel alloc] initWithFrame:CGRectMake(112, 27, 200, 30)];
        self.detailInfoLab.textColor=[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
        self.detailInfoLab.numberOfLines=0;
        self.detailInfoLab.font=[UIFont fontWithName:@"ZhunYuan" size:13];
        self.detailInfoLab.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.detailInfoLab];
        //网购价
        self.netMoneyLab=[[UILabel alloc] initWithFrame:CGRectMake(112, 62, 130, 20)];
        self.netMoneyLab.textColor=[UIColor redColor];
        self.netMoneyLab.font=[UIFont fontWithName:@"ZhunYuan" size:15];
        self.netMoneyLab.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.netMoneyLab];
        //市场价
        self.marketMoneyLab=[[UILabel alloc] initWithFrame:CGRectMake(232, 63, 90, 20)];
        self.marketMoneyLab.font=[UIFont fontWithName:@"ZhunYuan" size:11];
        self.marketMoneyLab.textColor=[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
        self.marketMoneyLab.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.marketMoneyLab];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
