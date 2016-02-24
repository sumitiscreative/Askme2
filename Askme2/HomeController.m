//
//  HomeController.m
//  Askme2
//
//  Created by Sumit Kumar Gupta on 23/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import "HomeController.h"

#import "OnlyImageCell.h"
#import "ScrollViewCell.h"
#import "CollectionCell.h"

#import "ImageManager.h"


#define kTemp1 @"temp1"
#define kTemp2 @"temp2"
#define kTemp3 @"temp3"

@interface HomeController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray* dataArray;
}

@end
@implementation HomeController
@synthesize tableView;

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"OnlyImageCell" bundle:nil] forCellReuseIdentifier:kTemp1];
    [self.tableView registerNib:[UINib nibWithNibName:@"CollectionCell" bundle:nil] forCellReuseIdentifier:kTemp2];
    [self.tableView registerNib:[UINib nibWithNibName:@"ScrollViewCell" bundle:nil] forCellReuseIdentifier:kTemp3];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"f_one" ofType:@"json"];
    dataArray = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:kNilOptions error:nil];
}

#pragma mark -- tableview
-(UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary* dict = [dataArray objectAtIndex:indexPath.row];

    if ([[dict objectForKey:@"template"] isEqualToString:@"product-template-1"]) {
        
        OnlyImageCell *cell = [tableView1 dequeueReusableCellWithIdentifier:kTemp1 forIndexPath:indexPath];

        NSString *iamgeURL = [[[dict objectForKey:@"items"] objectAtIndex:0] objectForKey:@"image"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSData* imageData = [ImageManager cacheAnyImageWithUrl:iamgeURL];
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imView.image = [UIImage imageWithData:imageData];
            });
        });
        
        return cell;
        
    }else if ([[dict objectForKey:@"template"] isEqualToString:@"product-template-2"]) {
        CollectionCell *cell = [tableView1 dequeueReusableCellWithIdentifier:kTemp2 forIndexPath:indexPath];
        cell.items = [[dict objectForKey:@"items"] copy];
        [cell createCollectionWithItems:[dict objectForKey:@"items"]];
        return cell;
    }else if ([[dict objectForKey:@"template"] isEqualToString:@"product-template-3"]) {
        
        ScrollViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:kTemp3 forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell createPageScrollWith:[dict objectForKey:@"items"]];
        return cell;
        
    }else{
        OnlyImageCell *cell = [tableView1 dequeueReusableCellWithIdentifier:kTemp1 forIndexPath:indexPath];
        
        NSString *iamgeURL = [[[dict objectForKey:@"items"] objectAtIndex:0] objectForKey:@"image"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSData* imageData = [ImageManager cacheAnyImageWithUrl:iamgeURL];
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imView.image = [UIImage imageWithData:imageData];
            });
        });
        
        return cell;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSDictionary *dict = [dataArray objectAtIndex:indexPath.row];
    if ([[dict objectForKey:@"template"] isEqualToString:@"product-template-1"]) {
        return 200.0f;
    }else if ([[dict objectForKey:@"template"] isEqualToString:@"product-template-2"]) {
        return 330.0f;
    }else if ([[dict objectForKey:@"template"] isEqualToString:@"product-template-3"]) {
        return 200.0f;
    }

    return 140.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

@end
