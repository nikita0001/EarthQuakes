//
//  EarthQuakes.h
//  NBN-Test
//
//  Created by Nikita Jain on 26/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EarthQuakes : NSObject


-(void)getEarthQuakesData:(NSString *)urlString  callBack:(void (^)(BOOL))callBack;
- (NSMutableArray *)getFeatures;
@end

NS_ASSUME_NONNULL_END
