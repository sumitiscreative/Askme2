//
//  Items.m
//  Askme2
//
//  Created by Sumit Kumar Gupta on 24/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import "Items.h"

@implementation Items
+(NSArray *)readItemsFromOne{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"f_one" ofType:@"json"];
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:kNilOptions error:nil];
}
+(NSArray *)readItemsFromTwo{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"f_two" ofType:@"json"];
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:kNilOptions error:nil];
}
@end
