//
//  BusinessCell.h
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
@interface BusinessCell : UITableViewCell
@property (nonatomic,strong) AsyncImageView *headImageView;
@property (nonatomic,strong) UILabel *addressLab;
@end
