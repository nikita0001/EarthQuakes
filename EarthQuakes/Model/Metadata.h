//
//  Metadata.h
//  NBN-Test
//
//  Created by Nikita Jain on 26/05/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Metadata : NSObject

@property NSUInteger generated;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *title;
@property NSInteger *status;
@property (strong, nonatomic) NSString *api;
@property NSInteger *count;

@end

NS_ASSUME_NONNULL_END
