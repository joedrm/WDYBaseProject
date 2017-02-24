//
//  LocationHelper.m
//  Pods
//
//  Created by fang wang on 17/1/20.
//
//

#import "LocationHelper.h"
#import <CoreLocation/CoreLocation.h>
#import "MJExtension.h"
#import "LocationConverter.h"

@interface LocationHelper()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locateManager; /*!< 定位管理 */
@property (nonatomic, copy) MKBlock block; /*!< 回调block */
@end

@implementation LocationHelper

SingletonM(LocaHelper)

- (void)locationWithBlock:(MKBlock)block{
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"Location services are not enabled");
        block(nil);
        return;
    }
    
    CLLocationManager *locateManager = [[CLLocationManager alloc] init];
    locateManager.delegate = self;
    locateManager.desiredAccuracy = kCLLocationAccuracyBest;
    locateManager.distanceFilter = 100;
    self.locateManager = locateManager;
    self.block = block;
    
    //    if ([locateManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
    //        [locateManager requestWhenInUseAuthorization];
    //    }else{
    //        [self.locateManager startUpdatingLocation];
    //    }
}

#pragma mark - ***** CLLocationManagerDelegate ******
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    NSLog(@"***** 请求定位 *****");
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            if ([manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                [manager requestWhenInUseAuthorization];
            }
            break;
        default:{
            [self.locateManager startUpdatingLocation];
        }
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations{
    NSLog(@"***** 定位 *****");
    [self.locateManager stopUpdatingLocation];
    
    MKLocationModel *localModel = [[MKLocationModel alloc] init];
    CLLocation *newLocation = locations.firstObject;
    CLLocationCoordinate2D coord = [LocationConverter wgs84ToGcj02:[newLocation coordinate]];
    localModel.latitude = [NSString stringWithFormat:@"%f", coord.latitude];
    localModel.longitude = [NSString stringWithFormat:@"%f", coord.longitude];
    
    CLGeocoder *gecoder = [[CLGeocoder alloc] init];
    [gecoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error == nil && [placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            localModel.country = placemark.country;
            localModel.administrativeArea = placemark.administrativeArea;
            localModel.subAdministrativeArea = placemark.subAdministrativeArea;
            localModel.locality = placemark.locality;
            localModel.subLocality = placemark.subLocality;
            localModel.thoroughfare = placemark.thoroughfare;
            localModel.subThoroughfare = placemark.subThoroughfare;
            localModel.postalCode = placemark.postalCode;
            localModel.address = placemark.name;
            localModel.ISOcountryCode = placemark.ISOcountryCode;
            localModel.inlandWater = placemark.inlandWater;
            localModel.ocean = placemark.ocean;
            
            
            NSLog(@"== placemark:%@", placemark.addressDictionary);
            //            ELog(@"== localModel getContent:%@",[localModel mk_jsonString]);
            //            ELog(@"== localModel jsonString:%@",[localModel mk_jsonStringNoBrace]);
            
            if (self.block) {
                self.block(localModel);
            }
        }else if(error == nil && [placemarks count] == 0){
            NSLog(@"No results were returned.");
            if (self.block) {
                self.block(nil);
            }
        }else if(error != nil) {
            NSLog(@"An error occurred = %@", error);
            if (self.block) {
                self.block(nil);
            }
        }
    }];
}

/** 定位失败 */
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"=== 定位失败");
    [self.locateManager stopUpdatingLocation];
    if (self.block) {
        self.block(nil);
    }
}
@end



@implementation MKLocationModel

MJCodingImplementation

- (void)setAddress:(NSString *)address{
    _address = address;
    _subAddress = [[[address stringByReplacingOccurrencesOfString:self.country withString:@""]
                    stringByReplacingOccurrencesOfString:self.administrativeArea withString:@""]
                   stringByReplacingOccurrencesOfString:self.locality withString:@""];
}
@end
