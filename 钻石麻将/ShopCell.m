//
//  ShopCell.m
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "ShopCell.h"
#import "myDefine.h"
@implementation ShopCell

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
        self.addressLab=[[UILabel alloc] initWithFrame:CGRectMake(112, 27, 200, 30)];
        self.addressLab.textColor=[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
        self.addressLab.numberOfLines=0;
        self.addressLab.font=[UIFont fontWithName:@"ZhunYuan" size:13];
        self.addressLab.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.addressLab];
        //网购价
        self.phoneNumLab=[[UILabel alloc] initWithFrame:CGRectMake(112, 60, 200, 20)];
        self.phoneNumLab.textColor=TEXTGRAYCOLOR;
        self.phoneNumLab.font=[UIFont systemFontOfSize:15];
        self.phoneNumLab.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.phoneNumLab];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
