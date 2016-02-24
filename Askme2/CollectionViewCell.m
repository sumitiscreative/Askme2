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
@synthesize detailView,oldPrice;
- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor colorWithRed:231 green:235 blue:244 alpha:1.0];
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0,2);
//    detailView.layer.shadowOpacity = 0.7;
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self.oldPrice.text];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName
                            value:@2
                            range:NSMakeRange(0, [attributeString length])];
    
    self.oldPrice.attributedText = attributeString;
}

@end
