//
//  CollectionCell.h
//  Askme2
//
//  Created by Sumit Kumar Gupta on 23/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, copy) NSArray* items;
@property(nonatomic) IBOutlet UICollectionView* collectionView;
@property(nonatomic, strong) IBOutlet UILabel* title;

-(void)createCollectionWithItems:(NSArray*)items;
@end
