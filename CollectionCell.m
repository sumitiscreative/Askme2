//
//  CollectionCell.m
//  Askme2
//
//  Created by Sumit Kumar Gupta on 23/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import "CollectionCell.h"
#import "CollectionViewCell.h"
#import "ImageManager.h"
#import <QuartzCore/QuartzCore.h>

@implementation CollectionCell 
@synthesize collectionView,items;

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor colorWithRed:231 green:235 blue:244 alpha:1.0];
    collectionView.backgroundColor = [UIColor colorWithRed:231 green:235 blue:244 alpha:1.0];
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    collectionView = [[UICollectionView alloc] initWithFrame:collectionView.frame collectionViewLayout:layout];
    
    [collectionView registerNib:[UINib nibWithNibName:kCollectionViewCell bundle:nil] forCellWithReuseIdentifier:kCollectionViewCell];

}

-(void)createCollectionWithItems:(NSArray *)items{
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary* thisItem = [items objectAtIndex:indexPath.row];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[thisItem objectForKey:@"web-url"]]];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.items count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [collectionView1 dequeueReusableCellWithReuseIdentifier:kCollectionViewCell forIndexPath:indexPath];
    
    cell.layer.cornerRadius = 5;
    cell.layer.masksToBounds = YES;
    
    NSDictionary* thisItem = [items objectAtIndex:indexPath.row];
    NSString* imageURL = ([thisItem objectForKey:@"image"]) ? [thisItem objectForKey:@"image"] : [thisItem objectForKey:@"image_url"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData* imageData = [ImageManager cacheAnyImageWithUrl:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.mainImage.image = [UIImage imageWithData:imageData];
            cell.title.text = [thisItem objectForKey:@"label"];
        });
    });
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView1 layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((collectionView1.frame.size.width)/3, collectionView.frame.size.height-20);
}

@end

