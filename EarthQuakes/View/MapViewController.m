//
//  MapViewController.m
//  NBN-Test
//
//  Created by Nikita Jain on 26/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>


@interface MapViewController ()

@property (strong,nonatomic)IBOutlet MKMapView *mapView;
@end
@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationDegrees lon = [[self.feature.geometry.coordinates objectAtIndex:0] floatValue];
    CLLocationDegrees lat = [[self.feature.geometry.coordinates objectAtIndex:1] floatValue];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    [self centerMapOnLocation:location];
    [self addAnnotation:location];
}

//this method will plot the address
- (void) addAnnotation:(CLLocation *) location {
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
    point.coordinate = coordinate;
    point.title = self.feature.type;
    point.subtitle = self.feature.place;
    [self.mapView addAnnotation:point];
}

- (void) centerMapOnLocation:(CLLocation *) location {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 800, 800);
    [self.mapView setRegion:region animated:true];
}

@end
