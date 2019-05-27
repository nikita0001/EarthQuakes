//
//  GeoGraphic.h
//  NBN-Test
//
//  Created by Nikita Jain on 26/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Metadata.h"

NS_ASSUME_NONNULL_BEGIN

@interface GeoGraphic : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) Metadata *metadata;
@property (strong, nonatomic) NSMutableArray *features;
@property (strong, nonatomic) NSArray *bbox;

@end

NS_ASSUME_NONNULL_END
