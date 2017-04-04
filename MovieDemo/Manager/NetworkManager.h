//
//  NetworkManager.h
//  MovieDemo
//
//  Created by Zankhna Gohil on 22/03/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface NetworkManager : NSObject

@property (nonatomic,strong)AFHTTPSessionManager *sessionManager;
@property (nonatomic,strong)NSString *url;

- (id)initWithURL :(NSString *)URL;
- (void)apiGetWithName :(NSString *)apiName Parameters:(id)param CompletionHandler:(void(^)(id response))completionHandler Failure:(void(^)(NSError *error))failure;

@end
