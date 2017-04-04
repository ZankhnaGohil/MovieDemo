//
//  HomeViewController.m
//  MovieDemo
//
//  Created by Zankhna Gohil on 22/03/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

#import "HomeViewController.h"
#import "NetworkManager.h"
#import "MovieResponse.h"
#import "MovieCollectionViewCell.h"
#import "MovieDetails.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "DetailViewController.h"

#define IMAGE_BASE_URL @"https://image.tmdb.org/t/p/w640/"

@interface HomeViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *dataSourceArray;
@property (nonatomic,assign)NSUInteger pageNumber;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageNumber = 0;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self fetchMovieData];
    self.dataSourceArray = [[NSMutableArray alloc]init];
    
    UINib *nib = [UINib nibWithNibName:@"MovieCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"MovieCellID"];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchMovieData{
    
    
    NSString *URLString = @"discover/movie?api_key=17be64f009f004298adba6df55c59ec4&page=";
    NSString *URLStringWithPage = [NSString stringWithFormat:@"%@%lu",URLString,(unsigned long)self.pageNumber+1];
    NetworkManager *manager = [[NetworkManager alloc]initWithURL:URLStringWithPage];
    [manager apiGetWithName:@"Movies"
                 Parameters:nil
          CompletionHandler:^(id response) {
              NSLog(@"The API response is : %@",response);
              self.pageNumber += 1;
              [MBProgressHUD hideHUDForView:self.view animated:YES];
              MovieResponse *movieResponse = [[MovieResponse alloc]initWithDictionary:response];
              [self.dataSourceArray addObjectsFromArray:movieResponse.results];
              [self.collectionView reloadData];
              
          }
                    Failure:^(NSError *error) {
                        NSLog(@"Error is : %@",error.localizedDescription);
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                    }];
    
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailViewController *detailVC = segue.destinationViewController;
    detailVC.movieDetails = sender;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataSourceArray.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCellID" forIndexPath:indexPath];
    
    MovieDetails *movieDetails = [self.dataSourceArray objectAtIndex:indexPath.row];
    NSString *imageUrl = [NSString stringWithFormat:@"%@%@",IMAGE_BASE_URL,movieDetails.poster_path];
    
    cell.labelTitle.text = movieDetails.title;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    if(indexPath.row == self.dataSourceArray.count-3){
    
        [self fetchMovieData];
    }
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(collectionView.frame.size.width/2 - 12, 250);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 8;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 8;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(8, 8, 8, 8);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    MovieDetails *movieDetails = [self.dataSourceArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"DetailSegueID" sender:movieDetails];
    
}

@end
