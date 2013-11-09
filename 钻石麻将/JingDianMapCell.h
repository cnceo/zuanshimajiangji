//
//  JingDianMapCell.h
//  IYLM
//
//  Created by Jian-Ye on 12-11-8.
//  Copyright (c) 2012年 Jian-Ye. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MapViewCellDelegate <NSObject>
-(void)showShopDetailInfo:(NSDictionary *)infoDic;

- (void)customMKMapViewDidSelectedWithInfo:(id)info;

@end
@interface JingDianMapCell : UIView<UIActionSheetDelegate>
@property (nonatomic,assign) id<MapViewCellDelegate>delegate;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UILabel *phoneLab;

@end
