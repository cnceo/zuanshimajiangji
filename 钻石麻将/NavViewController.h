//
//  NavViewController.h
//  钻石麻将
//
//  Created by demo on 13-11-5.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "FatherViewController.h"


#import "MapViewController.h"
#import "JingDianMapCell.h"
@interface NavViewController : FatherViewController<MapViewControllerDidSelectDelegate,MapViewCellDelegate>

@end
