//
//  CommonCell.h
//  钻石麻将
//
//  Created by 向 文品 on 13-11-8.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonCell : UITableViewCell
@property (nonatomic,strong) UIView *bodyView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *detailInfoLab;
@property (nonatomic,strong) UIImageView *moreButton;
@end
