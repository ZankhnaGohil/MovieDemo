//
//  DetailViewController.h
//  MovieDemo
//
//  Created by Zankhna Gohil on 27/03/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetails.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) MovieDetails *movieDetails;

@end
