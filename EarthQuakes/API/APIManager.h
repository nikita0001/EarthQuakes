//
//  APIManager.h
//  NBN-Test
//
//  Created by Nikita Jain on 26/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

- (void) getJsonRequestWithUrl:(NSURL *)url withCompletionHandler:(void (^)(NSMutableDictionary *dict, NSURLResponse *response, NSError *error))completionHandler;

@end

NS_ASSUME_NONNULL_END
