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
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    collectionView = [[UICollectionView alloc] initWithFrame:collectionView.frame collectionViewLayout:layout];
    
    [collectionView registerNib:[UINib nibWithNibName:kCollectionViewCell bundle:nil] forCellWithReuseIdentifier:kCollectionViewCell];

}

-(void)createCollectionWithItems:(NSArray *)items{
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.items count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [collectionView1 dequeueReusableCellWithReuseIdentifier:kCollectionViewCell forIndexPath:indexPath];
    
    
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
    return CGSizeMake((collectionView1.frame.size.width)/3, self.frame.size.height-40);
}

@end

