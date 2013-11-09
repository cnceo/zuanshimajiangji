//
//  AsyncImageView.m
//  AirMedia
//
//  Created by Xingzhi Cheng on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AsyncImageView.h"
#import "FullyLoaded.h"

#import "QuartzCore/QuartzCore.h"
@interface AsyncImageView ()
- (void) downloadImage:(NSString*)imageURL;
@end

@implementation AsyncImageView
@synthesize request = _request;
@synthesize imgURL = _imgURL, item = _item;
@synthesize isCut;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.myActivityView=[[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(frame.size.width/2, frame.size.height/2, 0, 0)] autorelease];
        [self.myActivityView setHidesWhenStopped:YES];
        [self.myActivityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:self.myActivityView];
        [self.myActivityView startAnimating];
        isCut=NO;
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

- (void) dealloc {
	self.request.delegate = nil;
    [self cancelDownload];
    [super dealloc];
}

- (void) loadImage:(NSString*)imageURL {
    [self loadImage:imageURL withPlaceholdImage:nil];
}

- (void) loadImage:(NSString*)imageURL withPlaceholdImage:(UIImage *)placeholdImage {
    self.image = placeholdImage;
    
    /*
    UIImage *image = [[FullyLoaded sharedFullyLoaded] imageForURL:imageURL];
    if (image) 
        self.image = image;
    else
        [self downloadImage:imageURL];
     */

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        UIImage *image = [[FullyLoaded sharedFullyLoaded] imageForURL:imageURL];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (image) {
                self.image = image;
                [self.myActivityView stopAnimating];
                if(isCut){
                    self.image=[self cropImage:self.image andRcct:CGRectMake(0, 0, self.image.size.width, self.image.size.height*0.9)];
                    [self.myActivityView stopAnimating];
                }
            }
            else
                [self downloadImage:imageURL];
        });
    });
}

- (void) cancelDownload {
    [self.myActivityView stopAnimating];
    [self.request cancel];
    self.request = nil;
}

- (void)setImageWithURL:(NSString *)urlString Size:(NSString *)size placeholderImage:(UIImage *)placeholder
{
    [self loadImage:[self ImageUrlWithSize:urlString Size:size] withPlaceholdImage:placeholder];
}
- (NSString *) ImageUrlWithSize : (NSString *) urlString Size: (NSString *) size {
    NSMutableString *img_url = [NSMutableString stringWithString:urlString];
    NSRange range = [urlString rangeOfString:@"." options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [img_url insertString:[NSString stringWithFormat:@"_%@", size] atIndex:range.location];
    }
    return img_url;
}


#pragma mark - 
#pragma mark private downloads

- (void) downloadImage:(NSString *)imageURL {
    [self cancelDownload];
	NSString * newImageURL = [imageURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    self.request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:newImageURL]];
    [self.request setDownloadDestinationPath:[[FullyLoaded sharedFullyLoaded] pathForImageURL:imageURL]];
    [self.request setDelegate:self];
    [self.request setCompletionBlock:^(void){
         self.request.delegate = nil;
         
         NSLog(@"async image download done");
         
         NSString * imageURL = [[self.request.originalURL absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.request = nil;
         
         dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
         dispatch_async(queue, ^{
            UIImage *image = [[FullyLoaded sharedFullyLoaded] imageForURL:imageURL];
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.image = image;
                if(isCut){
                    [self.myActivityView stopAnimating];
                    self.image=[self cropImage:self.image andRcct:CGRectMake(0, 0, self.image.size.width, self.image.size.height*0.9)];
                }
            });
    });}];
    [self.request setFailedBlock:^(void){
        [self.request cancel];
        self.request.delegate = nil;
        self.request = nil;
        
        NSLog(@"async image download failed");
     }];
    [self.request startAsynchronous];
//	NSLog(@"download Image %@", imageURL);
}

- (void) requestFinished:(ASIHTTPRequest *)request
{
    self.alpha = 0.01;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.8f];
    self.alpha = 1;
    [UIView commitAnimations];

    [self.myActivityView stopAnimating];
//    self.request.delegate = nil;
//    self.request = nil;
//
//    NSString * imageURL = [[request.originalURL absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
//    dispatch_async(queue, ^{
//        UIImage *image = [[FullyLoaded sharedFullyLoaded] imageForURL:imageURL];
//        dispatch_sync(dispatch_get_main_queue(), ^{
//                self.image = image;
//        });
//    });
}
//裁剪图片
-(UIImage *)cropImage:(UIImage *)image andRcct:(CGRect) rect{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect); //需要一个图像以及裁剪区域CGRect值
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef),CGImageGetHeight(subImageRef));
    UIGraphicsBeginImageContextWithOptions(smallBounds.size,NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    CGImageRelease(subImageRef);
    return smallImage;
}



@end
