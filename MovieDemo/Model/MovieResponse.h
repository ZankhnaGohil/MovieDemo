//
//  MovieResponse.h
//  MovieDemo
//
//  Created by Zankhna Gohil on 27/03/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieResponse : NSObject

@property (nonatomic,strong)NSNumber *page;
@property (nonatomic,strong)NSNumber *total_results;
@property (nonatomic,strong)NSNumber *total_pages;
@property (nonatomic,strong)NSMutableArray *results;

- (id)initWithDictionary :(NSDictionary *)dict;

@end
