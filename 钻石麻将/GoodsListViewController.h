//
//  GoodsListViewController.h
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsCell.h"
@interface GoodsListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign) NSInteger selectIndex;
@end
