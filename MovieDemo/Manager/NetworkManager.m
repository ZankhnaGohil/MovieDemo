//
//  NetworkManager.m
//  MovieDemo
//
//  Created by Zankhna Gohil on 22/03/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

#import "NetworkManager.h"

#define BASE_URL @"https://api.themoviedb.org/3/"

@implementation NetworkManager

- (id)initWithURL:(NSString *)URL{

    self = [super init];
    if (self) {
        NSString *url = [NSString stringWithFormat:@"%@%@",BASE_URL,URL];
        self.url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        self.sessionManager = [[AFHTTPSessionManager alloc]init];
        [self.sessionManager.requestSerializer setCachePolicy:1];
        
    }
    return self;
}

- (void)apiGetWithName:(NSString *)apiName Parameters:(id)param CompletionHandler:(void (^)(id response))completionHandler Failure:(void (^)(NSError *))failure{

    [self.sessionManager GET:self.url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

@end
