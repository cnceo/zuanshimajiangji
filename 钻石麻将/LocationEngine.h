//
//  LocationEngine.h
//  Grow Up
//
//  Created by xiaoyan.Huang on 11-5-16.
//  Copyright 2011 MEETStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@protocol LocationEngineDelegate;

@interface LocationEngine : NSObject
<CLLocationManagerDelegate,MKMapViewDelegate,MKReverseGeocoderDelegate,UIAlertViewDelegate> {
	CLLocationManager *locationManager;
	MKReverseGeocoder *reverseGeocoder;
	CLLocation *location;
	CLLocation *bestEffortAtLocation;
	float latitude;
	float longitude;
	
	NSString *locationState;
	NSString *locationName;
    NSString *firstLevel;
    NSString *secondLevel;
    NSString *thirdLevel;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) MKReverseGeocoder *reverseGeocoder;
@property (nonatomic, retain) CLLocation *location;
@property (nonatomic, retain) CLLocation *bestEffortAtLocation;

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

@property (nonatomic, retain) NSString *locationState;
@property (nonatomic, retain) NSString *locationName;
@property (nonatomic, retain) NSString *firstLevel;
@property (nonatomic, retain) NSString *secondLevel;
@property (nonatomic, retain) NSString *thirdLevel;

@property (assign) id<LocationEngineDelegate> locationDelegate;

+ (LocationEngine *)sharedLocationEngine;

- (void)startCheckingLocation;
- (void)stopCheckingLocation;



@end

@protocol LocationEngineDelegate <NSObject>
@optional

- (void)LocationDone;

@end
