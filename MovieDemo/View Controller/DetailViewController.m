//
//  DetailViewController.m
//  MovieDemo
//
//  Created by Zankhna Gohil on 27/03/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define IMAGE_BASE_URL @"https://image.tmdb.org/t/p/w640/"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self makeHeaderView];
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeHeaderView{

    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, 250);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    
    NSString *imageUrl = [NSString stringWithFormat:@"%@%@",IMAGE_BASE_URL,self.movieDetails.backdrop_path];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    self.tableView.tableHeaderView = imageView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = self.movieDetails.title;
            break;
            
        case 1:
            {
                 cell.textLabel.text = self.movieDetails.overview;
                 cell.textLabel.numberOfLines = 0;
            }
           
            break;
            
        default:
            break;
    }
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
