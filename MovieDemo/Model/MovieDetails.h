//
//  MovieDetails.h
//  MovieDemo
//
//  Created by Zankhna Gohil on 27/03/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetails : NSObject

@property(nonatomic,strong)NSString *backdrop_path;
@property(nonatomic,strong)NSString *overview;
@property(nonatomic,strong)NSNumber *vote_count;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSNumber *vote_average;
@property(nonatomic,strong)NSMutableArray *comments;
@property(nonatomic,strong)NSString *poster_path;

-(id)initWithDictionary :(NSDictionary *)dictionary;

@end
