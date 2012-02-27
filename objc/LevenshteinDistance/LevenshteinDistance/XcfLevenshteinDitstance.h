//
//  XcfLevenshteinDitstance.h
//  LevenshteinDistance
//
//  Created by March Liu on 12-2-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XcfLevenshteinDitstance : NSObject

+ (int) levenshteinDitstanceFromS:(NSString *)x toT:(NSString *)y;

@end
