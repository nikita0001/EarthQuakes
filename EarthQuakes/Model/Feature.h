//
//  Feature.h
//  NBN-Test
//
//  Created by Nikita Jain on 26/05/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Geometry.h"

NS_ASSUME_NONNULL_BEGIN

@interface Feature : NSObject
//@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString  *place;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString  *time;
@property (strong, nonatomic) NSString  *magnitude;
@property (strong, nonatomic) Geometry *geometry;


@end

NS_ASSUME_NONNULL_END
