//
//  ImageManager.h
//  Askme2
//
//  Created by Sumit Kumar Gupta on 24/02/16.
//  Copyright © 2016 Sumit kumar Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageManager : NSObject
+(NSData*)cacheAnyImageWithUrl:(NSString *)imageURL;
@end
