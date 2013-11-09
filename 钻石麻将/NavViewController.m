//
//  NavViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-5.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()
{
    UILabel *cityLab;
    MKMapView *_myMap;
    CLLocationManager *manager;
    
    MKAnnotationView *lastAnnView;
    
        MapViewController *_mapViewController;
    
}
@end

@implementation NavViewController

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
    [super viewDidLoad];
    
    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:@"30.281843",@"latitude",@"120.102193",@"longitude",nil];
    
    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:@"30.290144",@"latitude",@"120.146696‎",@"longitude",nil];
    
    NSDictionary *dic3=[NSDictionary dictionaryWithObjectsAndKeys:@"30.248076",@"latitude",@"120.164162‎",@"longitude",nil];
    
    NSDictionary *dic4=[NSDictionary dictionaryWithObjectsAndKeys:@"30.425622",@"latitude",@"120.299605",@"longitude",nil];
    
    NSArray *array = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4, nil];
    
	_mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    _mapViewController.delegate = self;
    [self.view addSubview:_mapViewController.view];
    [_mapViewController.view setFrame:self.view.bounds];
    [_mapViewController resetAnnitations:array];
//    _myMap=[[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, screenHeight-tabHeight)];
//    _myMap.delegate=self;
//    [self.view addSubview:_myMap];
	//添加导航条
    UIImageView *navbarImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    navbarImageView.image=[UIImage imageNamed:@"titlebar_xiangqing"];
    [self.view addSubview:navbarImageView];
    
    //titleLab
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleLabel.text=@"附近商户";
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.center=CGPointMake(160, 25);
    [self.view addSubview:titleLabel];
    //添加竖条分割线
    UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(245, 7, 2, 30)];
    sepImageView.image=[UIImage imageNamed:@"topline_xiangqing"];
    [self.view addSubview:sepImageView];
    //收藏按钮事件
    cityLab=[[UILabel alloc] initWithFrame:CGRectMake(270, 8, 50, 30)];
    [cityLab setText:@"成都"];
    cityLab.backgroundColor=[UIColor clearColor];
    cityLab.textColor=[UIColor whiteColor];
    cityLab.clipsToBounds=NO;
    cityLab.font=[UIFont fontWithName:@"ZhunYuan" size:16];
    [self.view addSubview:cityLab];
    //添加导航小图标
    UIImageView *navLittleImageView=[[UIImageView alloc] initWithFrame:CGRectMake(-15, 5, 13.5, 18)];
    navLittleImageView.image=[UIImage imageNamed:@"pitchicon_top"];
    
    [cityLab addSubview:navLittleImageView];

    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *newAnnotation=[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"biaoshi"];
    newAnnotation.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    newAnnotation.rightCalloutAccessoryView.tag=101;
    newAnnotation.canShowCallout=YES;
    newAnnotation.image=[UIImage imageNamed:@"icon_pitch2副本"];
    return newAnnotation;
}
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"导航",@"商户详情",@"010-322235", nil];
    [sheet showInView:self.view];
}
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    lastAnnView.image=[UIImage imageNamed:@"icon_pitch2副本"];
    view.image=[UIImage imageNamed:@"icon_pitch1副本"];
    lastAnnView=view;
    
}
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    
}
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    
}
- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    NSLog(@"sucess");
    CLLocation *location=[locations lastObject];
    //[_myMap setRegion:MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.01f, 0.01f))];
    [_myMap setRegion:MKCoordinateRegionMakeWithDistance(location.coordinate, 5000, 5000) animated:YES];
    _myMap.userLocation.subtitle=[NSString stringWithFormat:@"%.2f,%.2f",location.coordinate.latitude,location.coordinate.longitude];
    _myMap.userLocation.title=@"我的位置";
    
    CLGeocoder *geocoder=[[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks,NSError *error){
        if(placemarks.count>0){
            CLPlacemark *placemark=[placemarks objectAtIndex:0];
            NSString *country=placemark.ISOcountryCode;
            NSString *city=placemark.locality;
            NSLog(@"%@-%@",country,city);
        }
    }];
    //[manager stopUpdatingLocation];
}
-(IBAction)findMe:(id)sender
{
    [manager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;
{
    NSLog(@"fail");
    // [manager stopUpdatingLocation];
}
- (void)customMKMapViewDidSelectedWithInfo:(id)info
{
    
}
-(void)showShopDetailInfo:(NSDictionary *)infoDic
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
