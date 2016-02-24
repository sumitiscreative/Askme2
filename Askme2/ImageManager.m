//
//  ImageManager.m
//  Askme2
//
//  Created by Sumit Kumar Gupta on 24/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import "ImageManager.h"

@implementation ImageManager

+(NSData*)cacheAnyImageWithUrl:(NSString *)imageURL{
    
    if (!imageURL)
        return nil;
    
    @autoreleasepool {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString* cachePath = [paths lastObject];
            NSString* filePath = [cachePath stringByAppendingString:imageURL];
            
            //CHECK IF CACHE ALREADY EXIST THEN RETURN
            if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
            {
               
                return [NSData dataWithContentsOfFile:filePath];
               
            }
            
            //ELSE make a cache
            NSData *imageData;
            imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
            if(imageData)
            {
                [imageData writeToFile:filePath atomically:NO];
            }
            return imageData;
        
    }
    
}


@end
