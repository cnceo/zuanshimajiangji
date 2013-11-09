//
//  DongTaiCell.m
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "DongTaiCell.h"
#import "myDefine.h"
@implementation DongTaiCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLab=[[UILabel alloc] initWithFrame:CGRectMake(15, 7, 290, 20)];
        self.titleLab.backgroundColor=[UIColor clearColor];
        self.titleLab.font=[UIFont fontWithName:@"ZhunYuan" size:15];
        self.titleLab.textColor=[UIColor colorWithRed:68/255.0 green:124/255.0 blue:171/255.0 alpha:1];
        [self.contentView addSubview:self.titleLab];
        //添加详情
        self.detailInfoLab=[[UILabel alloc] initWithFrame:CGRectMake(15, 30, 290, 30)];
        self.detailInfoLab.numberOfLines=0;
        self.detailInfoLab.textColor=[UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1];
        self.detailInfoLab.backgroundColor=[UIColor clearColor];
        self.detailInfoLab.font=[UIFont fontWithName:@"ZhunYuan" size:13];
        [self.contentView addSubview:self.detailInfoLab];
        //添加时间
        self.timeLab=[[UILabel alloc] initWithFrame:CGRectMake(250, 63, 100, 10)];
        self.timeLab.backgroundColor=[UIColor clearColor];
        self.timeLab.textColor=[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
        self.timeLab.font=[UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.timeLab];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
