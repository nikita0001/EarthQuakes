//
//  APIManager.m
//  NBN-Test
//
//  Created by Nikita Jain on 26/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import "APIManager.h"
#import "AFNetworking.h"

@implementation APIManager

//API call to AFNetworking class
- (void) getJsonRequestWithUrl:(NSURL *)url withCompletionHandler:(void (^)(NSMutableDictionary *dict, NSURLResponse *response, NSError *error))completionHandler {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:NULL downloadProgress:NULL completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
        }
        NSMutableDictionary *dict = [(NSDictionary*) responseObject mutableCopy];
        completionHandler(dict,response, error);
    }];
    [dataTask resume];
}



@end
