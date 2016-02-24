//
//  CollectionViewCell.h
//  Askme2
//
//  Created by Sumit Kumar Gupta on 24/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCollectionViewCell @"CollectionViewCell"
@interface CollectionViewCell : UICollectionViewCell

@property(nonatomic) IBOutlet UIImageView* mainImage;
@property(nonatomic) IBOutlet UILabel* title;
@property(nonatomic) IBOutlet UILabel* oldPrice;
@property(nonatomic) IBOutlet UILabel* nPrice;
@property(nonatomic) IBOutlet UIButton* shopButton;
@property(nonatomic) IBOutlet UIView* detailView;

@end
