//
//  EarthQuakes.m
//  NBN-Test
//
//  Created by Nikita Jain on 26/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import "EarthQuakes.h"
#import "APIManager.h"
#import "Feature.h"
#import "GeoGraphic.h"
#import "Geometry.h"

@interface EarthQuakes ()

@property (strong, nonatomic) GeoGraphic *geoGraphic;

@end
@implementation EarthQuakes

//Call back from API class with response
-(void)getEarthQuakesData:(NSString *)urlString  callBack:(void (^)(BOOL))callBack
{
    APIManager *manager =  [[APIManager alloc]init];
    NSURL *URL = [NSURL URLWithString:urlString];
    [manager getJsonRequestWithUrl:URL withCompletionHandler:^(NSMutableDictionary *dict, NSURLResponse *response, NSError *error) {
        
        if (error) {
            callBack(NO);
            
        }
        if (dict){
           [self parseJSONObject:dict];
            callBack(YES);
        }

    }];
}

//parsing the data from response dictonary
- (void) parseJSONObject:(NSMutableDictionary *)object {
    self.geoGraphic = [[GeoGraphic alloc]init];
    Geometry *geometry = [[Geometry alloc] init];
    self.geoGraphic.type = [object objectForKey:@"type"];
    self.geoGraphic.metadata = [object objectForKey:@"metadata"];
    NSArray *featureArray = [object objectForKey:@"features"];
    self.geoGraphic.bbox =  [object objectForKey:@"bbox"];
    NSLog(@"features %@",self.geoGraphic.features);
    
    for (short i =0; i < featureArray.count; i++){
        Feature *feature = [[Feature alloc] init];
        NSDictionary *featureDict = [featureArray objectAtIndex:i];
        feature.magnitude = [[featureDict objectForKey:@"properties"]objectForKey:@"mag"];
        feature.place = [[featureDict objectForKey:@"properties"]objectForKey:@"place"];
        feature.type = [[featureDict objectForKey:@"properties"] objectForKey:@"type"];
        feature.time = [[featureDict objectForKey:@"properties"]objectForKey:@"time"];
        geometry.coordinates = [NSArray arrayWithArray:[[featureDict objectForKey:@"geometry"]objectForKey:@"coordinates"]];
        feature.geometry = geometry;
        
        NSLog(@"feature place %@",feature.place);
        [self.geoGraphic.features addObject:feature];
    }
}

//returing the feature array
- (NSMutableArray *) getFeatures {
    return self.geoGraphic.features;
}






@end
