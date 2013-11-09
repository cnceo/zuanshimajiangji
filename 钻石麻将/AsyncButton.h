//
//  AsyncButton.h
//  钻石麻将
//
//  Created by 向 文品 on 13-11-9.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
@interface AsyncButton : UIButton<ASIHTTPRequestDelegate>{
    NSURL * _imgURL;
    NSDictionary * _item;
}
@property(nonatomic, retain) ASIHTTPRequest * request;
@property (nonatomic, retain) NSURL *imgURL;
@property (nonatomic, copy) NSDictionary *item;
@property (nonatomic,assign) BOOL isCut;
@property (nonatomic,strong) UIActivityIndicatorView *myActivityView;
- (void) loadImage:(NSString*)imageURL;
- (void) loadImage:(NSString*)imageURL withPlaceholdImage:(UIImage*)image;
- (void) cancelDownload;
- (void) setImageWithURL:(NSString *)urlString Size:(NSString *)size placeholderImage:(UIImage *)placeholder;

@end
