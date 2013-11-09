




#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "CalloutMapAnnotation.h"
#import "BasicMapAnnotation.h"
#import "JingDianMapCell.h"
@protocol MapViewControllerDidSelectDelegate; 
@interface MapViewController : UIViewController<MKMapViewDelegate,UIActionSheetDelegate,CLLocationManagerDelegate>
{
    MKMapView *_mapView;

}
@property(nonatomic,retain)IBOutlet MKMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property(nonatomic,assign)UIViewController <MapViewControllerDidSelectDelegate,MapViewCellDelegate> *delegate;

- (void)resetAnnitations:(NSArray *)data;
@end

@protocol MapViewControllerDidSelectDelegate <NSObject>
@optional
- (void)customMKMapViewDidSelectedWithInfo:(id)info;

@end