//
//  MovieDetails.m
//  MovieDemo
//
//  Created by Zankhna Gohil on 27/03/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

#import "MovieDetails.h"

@implementation MovieDetails

- (id)initWithDictionary:(NSDictionary *)dictionary{

    self = [super init];
    if(self){
    
        self.backdrop_path = [dictionary objectForKey:@"backdrop_path"];
        self.vote_count = [dictionary objectForKey:@"vote_count"];
        self.vote_average = [dictionary objectForKey:@"vote_average"];
        self.overview = [dictionary objectForKey:@"overview"];
        self.title = [dictionary objectForKey:@"title"];
        self.poster_path = [dictionary objectForKey:@"poster_path"];
        
        
    }
        return self;
}

@end
