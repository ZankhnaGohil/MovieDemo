//
//  MovieResponse.m
//  MovieDemo
//
//  Created by Zankhna Gohil on 27/03/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

#import "MovieResponse.h"
#import "MovieDetails.h"

@implementation MovieResponse

- (id)initWithDictionary:(NSDictionary *)dict{

    self = [super init];
    if(self){
    
        self.page = [dict objectForKey:@"page"];
        self.total_pages = [dict objectForKey:@"total_pages"];
        self.total_results = [dict objectForKey:@"total_results"];
        NSArray *resultsArrayFromDict = [dict objectForKey:@"results"];
        self.results = [NSMutableArray new];
        
        for (NSDictionary *resultsDict in resultsArrayFromDict) {
            MovieDetails *movieDetails = [[MovieDetails alloc]initWithDictionary:resultsDict];
            [self.results addObject:movieDetails];
        }
        
    }
    return self;
}

@end
