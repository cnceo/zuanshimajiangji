//
//  AsyncImageView.h
//  AirMedia
//
//  Created by Xingzhi Cheng on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface AsyncImageView : UIImageView <ASIHTTPRequestDelegate>{
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
