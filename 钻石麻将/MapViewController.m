//
//  MapViewController.m
//  
//
//  Created by Jian-Ye on 12-10-16.
//  Copyright (c) 2012年 Jian-Ye. All rights reserved.
//

#import "MapViewController.h"
#import "CallOutAnnotationVifew.h"
#import "NavDetailViewController.h"
#define SPAN 40000

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
@interface MapViewController ()
{
    NSMutableArray *_annotationList;
    
    CalloutMapAnnotation *_calloutAnnotation;
	CalloutMapAnnotation *_previousdAnnotation;
    
    CallOutAnnotationVifew *lastAnnView;
    CLLocation *currentLocation;
    BOOL isRemove;

}
-(void)setAnnotionsWithList:(NSArray *)list;

@end

@implementation MapViewController

@synthesize mapView=_mapView;
@synthesize locationManager;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    _annotationList = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    locationManager.distanceFilter = 10.0f;
    
    [locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
//    CLLocationCoordinate2D theCoordinate;
//    theCoordinate.latitude = newLocation.coordinate.latitude;
//    theCoordinate.longitude = newLocation.coordinate.longitude;
//    //[self.mmapView setCenterCoordinate:theCoordinate];
//
//    //设定显示范围
//    MKCoordinateSpan theSpan;
//    theSpan.latitudeDelta=0.1;
//    theSpan.longitudeDelta=0.1;
//    //设置地图显示的中心及范围
//    MKCoordinateRegion theRegion;
//    theRegion.center=theCoordinate;
//    theRegion.span=theSpan;
//    
//    // 设置地图显示的类型及根据范围进行显示
//    [self.mapView setRegion:theRegion];
}
-(void)setAnnotionsWithList:(NSArray *)list
{
    for (NSDictionary *dic in list) {
        
        CLLocationDegrees latitude=[[dic objectForKey:@"latitude"] doubleValue];
        CLLocationDegrees longitude=[[dic objectForKey:@"longitude"] doubleValue];
        CLLocationCoordinate2D location=CLLocationCoordinate2DMake(latitude, longitude);
        
        MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location,SPAN ,SPAN );
        MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:region];
        [_mapView setRegion:adjustedRegion animated:YES];
        
        BasicMapAnnotation *  annotation=[[BasicMapAnnotation alloc] initWithLatitude:latitude andLongitude:longitude];
        [_mapView   addAnnotation:annotation];
    }
}

//选中大头针事件
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
	if ([view.annotation isKindOfClass:[BasicMapAnnotation class]]) {
        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            return;
        }
        if (_calloutAnnotation) {
            [mapView removeAnnotation:_calloutAnnotation];
            _calloutAnnotation = nil;
        }
        _calloutAnnotation = [[CalloutMapAnnotation alloc]
                               initWithLatitude:view.annotation.coordinate.latitude
                               andLongitude:view.annotation.coordinate.longitude];
        [mapView addAnnotation:_calloutAnnotation];
        
        [mapView setCenterCoordinate:_calloutAnnotation.coordinate animated:YES];
        lastAnnView.image=[UIImage imageNamed:@"icon_pitch2副本.png"];
        view.image = [UIImage imageNamed:@"icon_pitch1副本.png"];
        lastAnnView=(CallOutAnnotationVifew *)view;
        
	}
    else{
        if([_delegate respondsToSelector:@selector(customMKMapViewDidSelectedWithInfo:)]){
            [_delegate customMKMapViewDidSelectedWithInfo:@"点击至之后你要在这干点啥"];
        }
    }
}
//放弃点击事件
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if (isRemove) {
        isRemove=NO;
        return;
    }
    if (_calloutAnnotation) {
        [mapView removeAnnotation:_calloutAnnotation];
        _calloutAnnotation = nil;
    }
    lastAnnView.image=[UIImage imageNamed:@"icon_pitch2副本.png"];
    lastAnnView=nil;
}
//获取气泡代理
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	if ([annotation isKindOfClass:[CalloutMapAnnotation class]]) {

        CallOutAnnotationVifew *annotationView = (CallOutAnnotationVifew *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutView"];
        
        if (!annotationView) {
            annotationView = [[CallOutAnnotationVifew alloc] initWithAnnotation:annotation reuseIdentifier:@"CalloutView"];
            JingDianMapCell  *cell = [[JingDianMapCell alloc] init];
            cell.delegate=self.delegate;
            cell.titleLab.text=@"万柳桥店";
            cell.addressLabel.text=@"成都市成华区万年场";
            cell.phoneLab.text=@"028-2335243523";
            annotationView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [annotationView.contentView insertSubview:cell belowSubview:annotationView.rightCalloutAccessoryView];
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectShop:)];
            [annotationView addGestureRecognizer:tap];
            //添加信息
        }
        
        return annotationView;
	} else if ([annotation isKindOfClass:[BasicMapAnnotation class]]) {
        
         MKAnnotationView *annotationView =[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomAnnotation"] ;
            annotationView.canShowCallout = NO;
            annotationView.image = [UIImage imageNamed:@"icon_pitch2副本.png"];
        }
		return annotationView;
    }
	return nil;
}
//选取气泡事件
-(void)selectShop:(UITapGestureRecognizer *)tap
{
    isRemove=YES;
    CallOutAnnotationVifew *annView=(CallOutAnnotationVifew *)[tap view];
    CGPoint point=[tap locationInView:annView];
    
    
    if (point.x>0&&point.y>50&&point.x<181&&point.y<76) {
        [self phoneButtonClick];
    }else if(point.x>0&&point.y>84&&point.x<103&&point.y<120){
        [self nav2SelectShop];
    }else if(point.x>106&&point.y>86&&point.x<225&&point.y<120){
        [self showDetailSelectShop];
    }
}
//打电话事件
-(void)phoneButtonClick
{
    NSLog(@"打电话");
    return;
    NSString *phoneStr=[lastAnnView.infoDic objectForKey:@""];
    UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:phoneStr, nil];
    [sheet showInView:self.view];

}
//导航按钮事件
-(void)nav2SelectShop
{
    NSLog(@"导航");
    return;
    CLLocation *toLoc=[lastAnnView.infoDic objectForKey:@""];
    if (SYSTEM_VERSION_LESS_THAN(@"6.0")) { // ios6以下，调用google map
        
        NSString *urlString = [[NSString alloc] initWithFormat:@"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f&dirfl=d",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude,toLoc.coordinate.latitude,toLoc.coordinate.longitude];
        NSURL *aURL = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:aURL];
    } else { // 直接调用ios自己带的apple map
        CLLocationCoordinate2D to;
        to.latitude = toLoc.coordinate.latitude;
        to.longitude = toLoc.coordinate.longitude;
        MKMapItem *currentLoc = [MKMapItem mapItemForCurrentLocation];
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:to addressDictionary:nil] ];
        toLocation.name = [lastAnnView.infoDic objectForKey:@"name"];
        [MKMapItem openMapsWithItems:[NSArray arrayWithObjects:currentLoc, toLocation, nil]
                       launchOptions:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeDriving, [NSNumber numberWithBool:YES], nil] forKeys:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeKey, MKLaunchOptionsShowsTrafficKey, nil]]];
        
        
    }
}
-(void)showDetailSelectShop
{
    
    NavDetailViewController *navDetailVC=[[NavDetailViewController alloc] init];
    [self.delegate presentViewController:navDetailVC animated:YES completion:nil];
}
//选取方案
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *selectStr=[actionSheet buttonTitleAtIndex:0];
    if (![selectStr isEqualToString:@"取消"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat: @"tel://%@",selectStr]]];
        
    }
}

- (void)resetAnnitations:(NSArray *)data
{
    [_annotationList removeAllObjects];
    [_annotationList addObjectsFromArray:data];
    [self setAnnotionsWithList:_annotationList];
}
@end
