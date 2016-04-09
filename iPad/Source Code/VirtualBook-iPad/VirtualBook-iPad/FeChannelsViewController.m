//
//  FeChannelsViewController.m
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import "FeChannelsViewController.h"
#import "VVSpringCollectionViewFlowLayout.h"
#import "FeChannelCell.h"

@interface FeChannelsViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation FeChannelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCommon];
    
    [self initCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initCommon
{
    self.view.backgroundColor = [UIColor clearColor];
}
-(void) initCollectionView
{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"FeChannelCell" bundle:nil] forCellWithReuseIdentifier:@"FeChannelCell"];
    
    VVSpringCollectionViewFlowLayout *layout = [VVSpringCollectionViewFlowLayout new];
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 30;
    layout.itemSize = CGSizeMake(250, 250);
    layout.sectionInset = UIEdgeInsetsMake(8, 32, 32, 16);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    [self.collectionView setCollectionViewLayout:layout];
}

#pragma mark - Collection View
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FeChannelCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"FeChannelCell" forIndexPath:indexPath];
    
    [cell updateAssetWithItem:indexPath.item];
    
    return cell;
}
-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(250, 250);
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //FeDetailSlideViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"FeDetailSlideViewController"];
    
    //FeChannelViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"FeChannelViewController"];
    
    //[self.navigationController pushViewController:controller animated:YES];
}

@end
