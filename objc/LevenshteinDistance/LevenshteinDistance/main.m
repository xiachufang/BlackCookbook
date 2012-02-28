//
//  main.m
//  LevenshteinDistance
//
//  Created by March Liu on 12-2-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcfLevenshteinDitstance.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Levenshitein Distance!");
        
       NSArray *array = [[NSArray alloc] initWithObjects:@"march.liu@gmail.com", 
                         @"noreply@gmail.com", 
                         @"noreply@qmail.com", 
                         @"liuxin2@kingsoft.com",
                         @"march@xiachufang.com", nil];

       for (NSString *source in array) {
           for (NSString *target in array) {
               NSLog(@"the ditance of %@ and %@ is %d", source, target,
                     [XcfLevenshteinDitstance levenshteinDitstanceFromS:source toT:target]);
           }
       }
    }
    return 0;
}

