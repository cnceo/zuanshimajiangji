//
//  BusinessCell.m
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "BusinessCell.h"

@implementation BusinessCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.headImageView=[[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 165)];
        [self.contentView addSubview:self.headImageView];
        //添加下部阴影
        UIImageView *bottomImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 165-30, 320, 30)];
        bottomImageView.image=[UIImage imageNamed:@"titlebar_map副本"];
        [self.contentView addSubview:bottomImageView];
        //添加地址
        self.addressLab=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 30)];
        self.addressLab.backgroundColor=[UIColor clearColor];
        self.addressLab.textAlignment=NSTextAlignmentRight;
        self.addressLab.textColor=[UIColor whiteColor];
        self.addressLab.font=[UIFont fontWithName:@"ZhunYuan" size:15];
        [bottomImageView addSubview:self.addressLab];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
