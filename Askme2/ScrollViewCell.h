//
//  ScrollViewCell.h
//  Askme2
//
//  Created by Sumit Kumar Gupta on 24/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewCell : UITableViewCell <UIScrollViewDelegate>
@property(nonatomic) IBOutlet UIScrollView* scrollView;
@property(nonatomic) IBOutlet UIPageControl* pageControl;

-(void)createPageScrollWith:(NSArray*)items;
@end
