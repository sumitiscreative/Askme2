//
//  CollectionViewdetailView.m
//  Askme2
//
//  Created by Sumit Kumar Gupta on 24/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import "CollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation CollectionViewCell
@synthesize detailView;
- (void)awakeFromNib {
    // Initialization code
    detailView.layer.shadowColor = [UIColor blackColor].CGColor;
    detailView.layer.shadowOffset = CGSizeMake(0, 2);
    detailView.layer.shadowRadius = 1.0;
    detailView.layer.shadowOpacity = 0.2;
}

@end
