//
//  LocationEngine.m
//  Grow UP
//
//  Created by xiaoyan.Huang on 11-5-16.
//  Copyright 2011 MEETStudio. All rights reserved.
//

#import "LocationEngine.h"
@interface LocationEngine (Private)

- (void)geocoderAddress;

- (void)stopUpdatingLocation:(NSString *)state;
- (void)stopReverseGeocoder:(NSString *)state;
@end



@implementation LocationEngine

@synthesize locationDelegate;

@synthesize locationManager;
@synthesize reverseGeocoder;
@synthesize location;
@synthesize bestEffortAtLocation;

@synthesize latitude;
@synthesize longitude;

@synthesize locationState;
@synthesize locationName;
@synthesize firstLevel,secondLevel,thirdLevel;

static LocationEngine *_shareEngine = nil;

+ (LocationEngine *)sharedLocationEngine{
	if (!_shareEngine) {
		_shareEngine = [[LocationEngine alloc] init];
        
        _shareEngine.locationState = @"Error";
	}
    
	return _shareEngine;
}

- (void)startCheckingLocation{
    if ([self.locationState isEqualToString:@"Done"]) {
        
        return;
    }
    
    if ([self.locationState isEqualToString:@"Acquired Location"]) {
        [self  geocoderAddress];
        
        ////[LoadingView showDefaultLoadingView];//编译提示空，暂时屏蔽
    }
    else {
        
        
        if ([CLLocationManager locationServicesEnabled]) {
            
            ////[LoadingView showDefaultLoadingView];
            
            self.locationManager = [[[CLLocationManager alloc] init] autorelease];
            
            
            if (_shareEngine.locationManager.locationServicesEnabled == NO)
            {
                UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"请启用“定位服务”来允许添加地理位置" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"好",nil];
                [servicesDisabledAlert show];
                [servicesDisabledAlert release];
                
                return;
            }
            
            self.locationManager.delegate = self;
            self.locationManager.desiredAccuracy = 1000.0;
            //self.locationManager.distanceFilter = 10.0;
            
            [self.locationManager startUpdatingLocation];
            
            if (![self.locationState isEqualToString:@"Done"]) {
                self.locationState = NSLocalizedString(@"Updating", @"Updating");
            }
            
            [self performSelector:@selector(stopUpdatingLocation:) withObject:@"Timed Out" afterDelay:15.0];
        }
        else {
            //if (_shareEngine.locationManager.locationServicesEnabled == NO)
            UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"请启用“定位服务”来允许添加地理位置" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"好",nil];
            [servicesDisabledAlert show];
            [servicesDisabledAlert release];
            
            return;
        }
        
    }
    
	
    
}

- (void)stopCheckingLocation{
    //	[self.locationManager stopUpdatingLocation];
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	
	NSLog(@"update");
    
    NSLog(@"latitude %f longitude %f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);
	
	location = newLocation;
	
	NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    
    
    NSLog(@"horizontalAccuracy %f",newLocation.horizontalAccuracy);
    if (locationAge > 5.0) return;
    // test that the horizontal accuracy does not indicate an invalid measurement
    if (newLocation.horizontalAccuracy < 0) return;
    // test the measurement to see if it is more accurate than the previous measurement
    if (bestEffortAtLocation == nil || bestEffortAtLocation.horizontalAccuracy > newLocation.horizontalAccuracy) {
        // store the location as the "best effort"
        self.bestEffortAtLocation = newLocation;
        // test the measurement to see if it meets the desired accuracy
        //
        // IMPORTANT!!! kCLLocationAccuracyBest should not be used for comparison with location coordinate or altitidue
        // accuracy because it is a negative value. Instead, compare against some predetermined "real" measure of
        // acceptable accuracy, or depend on the timeout to stop updating. This sample depends on the timeout.
        //
        
        
        if (newLocation.horizontalAccuracy <= locationManager.desiredAccuracy) {
            // we have a measurement that meets our requirements, so we can stop updating the location
            //
            // IMPORTANT!!! Minimize power usage by stopping the location manager as soon as possible.
			
			latitude = newLocation.coordinate.latitude;
			longitude = newLocation.coordinate.longitude;
			
            if (![self.locationState isEqualToString:@"Done"]) {
                self.locationState = @"Acquired Location";
            }
			
			
            [self stopUpdatingLocation:@"Acquired Location"];
            // we can also cancel our previous performSelector:withObject:afterDelay: - it's no longer necessary
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(stopUpdatingLocation:) object:nil];
			
			
			NSLog(@"获取地址信息");
			//获取地址
			[self geocoderAddress];
			
			////[LoadingView showDefaultLoadingView];
		}
    }
	
	NSLog(@"latitude %f longitude %f",latitude,longitude);
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
	
	NSLog(@"update");
    
    NSLog(@"locations = %@",locations);
    
    CLLocation *newLocation = [locations objectAtIndex:0];
    
    NSLog(@"latitude %f longitude %f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);
	
	location = newLocation;
	
	NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    
    
    NSLog(@"horizontalAccuracy %f",newLocation.horizontalAccuracy);
    if (locationAge > 5.0) return;
    // test that the horizontal accuracy does not indicate an invalid measurement
    if (newLocation.horizontalAccuracy < 0) return;
    // test the measurement to see if it is more accurate than the previous measurement
    if (bestEffortAtLocation == nil || bestEffortAtLocation.horizontalAccuracy > newLocation.horizontalAccuracy) {
        // store the location as the "best effort"
        self.bestEffortAtLocation = newLocation;
        // test the measurement to see if it meets the desired accuracy
        //
        // IMPORTANT!!! kCLLocationAccuracyBest should not be used for comparison with location coordinate or altitidue
        // accuracy because it is a negative value. Instead, compare against some predetermined "real" measure of
        // acceptable accuracy, or depend on the timeout to stop updating. This sample depends on the timeout.
        //
        
        
        if (newLocation.horizontalAccuracy <= locationManager.desiredAccuracy) {
            // we have a measurement that meets our requirements, so we can stop updating the location
            //
            // IMPORTANT!!! Minimize power usage by stopping the location manager as soon as possible.
			
			latitude = newLocation.coordinate.latitude;
			longitude = newLocation.coordinate.longitude;
			
            if (![self.locationState isEqualToString:@"Done"]) {
                self.locationState = @"Acquired Location";
            }
			
			
            [self stopUpdatingLocation:@"Acquired Location"];
            // we can also cancel our previous performSelector:withObject:afterDelay: - it's no longer necessary
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(stopUpdatingLocation:) object:nil];
			
			
			NSLog(@"获取地址信息");
			//获取地址
			[self geocoderAddress];
			
			////[LoadingView showDefaultLoadingView];
		}
    }
	
	NSLog(@"latitude %f longitude %f",latitude,longitude);
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	NSLog(@"location error:%@",error);
	if ([error code] != kCLErrorLocationUnknown) {
        if ([error code] == kCLErrorDenied || [error code] == kCLErrorRegionMonitoringDenied) {
            
            UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"请启用“定位服务”来允许添加地理位置" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"好",nil];
            [servicesDisabledAlert show];
            [servicesDisabledAlert release];
        }
        
        [self stopUpdatingLocation:NSLocalizedString(@"Error", @"Error")];
    }
	
	////[LoadingView hideWithAnimated:YES];
}

- (void)stopUpdatingLocation:(NSString *)state {
	NSLog(@"location stop with %@", state);
    [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
	////[LoadingView hideWithAnimated:YES];
    
    //如果是请求超时则结束location
    if (([state isEqualToString:@"Timed Out"] ||[state isEqualToString:@"Error"])
        && ![state isEqualToString:@"Done"]
        && ![state isEqualToString:@"Acquired Location"]) {
        
        if (![self.locationState isEqualToString:@"Done"]) {
            self.locationState = state;
        }
        
        if (locationDelegate != nil) {
            [locationDelegate LocationDone];
        }
        locationDelegate = nil;
    }
    
    
    
}

#pragma mark Grocoder
- (void)geocoderAddress{
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = latitude;
    coordinate.longitude = longitude ;
    
    double sysVersion = [[[UIDevice currentDevice] systemVersion] doubleValue];
    CLog(@"system version %f", sysVersion);
    if (sysVersion >=5.0) {
        //CLGeocoder
        CLGeocoder *geocoder = [[[CLGeocoder alloc] init] autorelease];
        
        CLLocation *location1 = [[[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude] autorelease];
        
        
        [geocoder reverseGeocodeLocation:location1 completionHandler:^(NSArray *placemarks, NSError *error) {
            CLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
            if (error){
                NSLog(@"Geocode failed with error: %@", error);
                [self displayError:error];
                return;
            }
            CLog(@"Received placemarks: %@", placemarks);
            [self displayPlacemarks:placemarks];
        }];
    }
    else {
        //MKReverseGeocoder
        self.reverseGeocoder =
        [[[MKReverseGeocoder alloc] initWithCoordinate:coordinate] autorelease];
        self.reverseGeocoder.delegate = self;
        [self.reverseGeocoder setIsAccessibilityElement:YES];
        [self.reverseGeocoder start];
        
        [self performSelector:@selector(stopReverseGeocoder:) withObject:@"Timed Out" afterDelay:10.0];
        
    }
    
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog(@"MKReverseGeocoder has failed.");
	
	////[LoadingView hideWithAnimated:YES];
    if (![self.locationState isEqualToString:@"Done"]) {
        self.locationState = @"Error";
    }
    
    if (locationDelegate != nil) {
        [locationDelegate LocationDone];
    }
    locationDelegate = nil;
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    // NSLog(@"find %@", placemark.name);
	////[LoadingView hideWithAnimated:YES];
    
	//self.locationName = placemark.locality;//placemark.thoroughfare;
    
    self.firstLevel = [NSString stringWithFormat:@"%@%@",placemark.country,placemark.administrativeArea];
    self.secondLevel = [NSString stringWithFormat:@"%@%@",firstLevel,placemark.locality];
    self.thirdLevel = [NSString stringWithFormat: @"%@%@%@",secondLevel,placemark.subLocality,placemark.thoroughfare];
    
    //self.locationName = placemark.locality;
	self.locationState = @"Done";
    
    NSLog(@"place name %@", self.thirdLevel);
    
    [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
    
    if (locationDelegate != nil) {
        [locationDelegate LocationDone];
    }
    locationDelegate = nil;
}

- (void)stopReverseGeocoder:(NSString *)state
{
	NSLog(@"Reverse geocoder %@", state);
	[self.reverseGeocoder cancel];
    
    if (![self.locationState isEqualToString:@"Done"]) {
        self.locationState = @"Error";
    }
    
    if (locationDelegate != nil) {
        [locationDelegate LocationDone];
    }
    locationDelegate = nil;
}



#pragma mark -
#pragma mark Display Results

// display the results
- (void)displayPlacemarks:(NSArray *)placemarks
{
    
    dispatch_async(dispatch_get_main_queue(),^ {
        
    });
    
    if ([placemarks count] >0) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        // self.locationName = placemark.locality;//placemark.thoroughfare;
        self.firstLevel = [NSString stringWithFormat:@"%@%@",placemark.country,placemark.administrativeArea];
        self.secondLevel = [NSString stringWithFormat:@"%@%@",firstLevel,placemark.locality];
        self.thirdLevel = [NSString stringWithFormat: @"%@%@%@",secondLevel,placemark.subLocality,placemark.thoroughfare];
        
        self.locationState = @"Done";
    }
    else {
        if (![self.locationState isEqualToString:@"Done"]) {
            self.locationState = @"Error";
        }
    }
    
    NSLog(@"places count %d  name %@", [placemarks count], self.firstLevel,self.secondLevel,self.thirdLevel);
    
    
    if (locationDelegate != nil) {
        [locationDelegate LocationDone];
    }
    locationDelegate = nil;
}

// display a given NSError in an UIAlertView
- (void)displayError:(NSError*)error
{
    dispatch_async(dispatch_get_main_queue(),^ {
        
        NSString *message;
        switch ([error code])
        {
            case kCLErrorGeocodeFoundNoResult: message = @"kCLErrorGeocodeFoundNoResult";
                break;
            case kCLErrorGeocodeCanceled: message = @"kCLErrorGeocodeCanceled";
                break;
            case kCLErrorGeocodeFoundPartialResult: message = @"kCLErrorGeocodeFoundNoResult";
                break;
            default: message = [error description];
                break;
        }
        
        //        UIAlertView *alert =  [[[UIAlertView alloc] initWithTitle:@"地理信息获取失败！"
        //                                                          message:@""
        //                                                         delegate:nil
        //                                                cancelButtonTitle:@"确定"
        //                                                otherButtonTitles:nil] autorelease];;
        //        [alert show];
    });
    
    if (![self.locationState isEqualToString:@"Done"]) {
        self.locationState = @"Error";
    }
    if (locationDelegate != nil) {
        [locationDelegate LocationDone];
    }
    locationDelegate = nil;
}


#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    CLog(@"button index %d", buttonIndex);
    //[LoadingView hideWithAnimated:YES];
    
    switch (buttonIndex) {
        case 0:
        {
            if (locationDelegate != nil) {
                [locationDelegate LocationDone];
            }
            break;
        }
        case 1:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"]];
            if (locationDelegate != nil) {
                [locationDelegate LocationDone];
            }
            break;
        }
        default:
            break;
    }
    
}

@end


