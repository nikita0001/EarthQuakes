//
//  GeoGraphic.m
//  NBN-Test
//
//  Created by Nikita Jain on 26/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import "GeoGraphic.h"

@implementation GeoGraphic
- (id) init {
    if (self = [super init]) {
        self.features = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
