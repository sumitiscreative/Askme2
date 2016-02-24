//
//  ScrollViewCell.m
//  Askme2
//
//  Created by Sumit Kumar Gupta on 24/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import "ScrollViewCell.h"
#import "ImageManager.h"

@implementation ScrollViewCell
@synthesize scrollView,pageControl;

- (void)awakeFromNib {
    // Initialization code
    scrollView.pagingEnabled = YES;
    scrollView.maximumZoomScale = 1.0;
    scrollView.minimumZoomScale = 1.0;
    scrollView.clipsToBounds = YES;

    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
}

-(void)createPageScrollWith:(NSArray*)items{
    
    CGFloat desiredWidth = self.frame.size.width;
    CGFloat desiredHeight = self.frame.size.height;
    CGRect frame = scrollView.frame;
    frame.size.width = desiredWidth;
    frame.size.height = desiredHeight;
    [scrollView setFrame:frame];
    
    scrollView.contentSize = CGSizeMake(desiredWidth*[items count], scrollView.frame.size.height);

    // create paginated scroll 
    for (int i=0; i<[items count]; i++) {
        
        NSDictionary *thisItem = [items objectAtIndex:i];
        UIImageView* imView = [[UIImageView alloc] initWithFrame:CGRectMake(i * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
        
        NSString* imageURL = ([thisItem objectForKey:@"image"]) ? [thisItem objectForKey:@"image"] : [thisItem objectForKey:@"image_url"];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSData* imageData = [ImageManager cacheAnyImageWithUrl:imageURL];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                imView.image = [UIImage imageWithData:imageData];
                NSLog(@"%@ %ld",imageURL,[items count]);
            });
        });
        [scrollView addSubview:imView];
    }
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, scrollView.frame.size.height-30, scrollView.frame.size.width, 20)];
    pageControl.center = CGPointMake(self.contentView.center.x, pageControl.frame.origin.y);
    pageControl.numberOfPages = [items count];
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:pageControl];
}

// change page here
- (IBAction)changePage:(id)sender {
    CGFloat x = pageControl.currentPage * scrollView.frame.size.width;
    [scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

// update the page number here
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView1  {
    NSInteger pageNumber = roundf(scrollView1.contentOffset.x / (scrollView1.frame.size.width));
    pageControl.currentPage = pageNumber;
}

-(void)scrollViewDidScroll:(UIScrollView *)aScrollView{
    [aScrollView setContentOffset: CGPointMake(aScrollView.contentOffset.x,0)];
}

@end
